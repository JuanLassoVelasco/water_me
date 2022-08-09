import 'package:flutter/material.dart';
import 'package:water_me/constants.dart';
import 'package:flutter_blue/flutter_blue.dart';

class AddDevicePopup extends StatefulWidget {
  const AddDevicePopup({Key key, @required this.flutterBlue}) : super(key: key);

  final FlutterBlue flutterBlue;

  @override
  State<AddDevicePopup> createState() => _AddDevicePopupState();
}

class _AddDevicePopupState extends State<AddDevicePopup> {
  String deviceName;
  List<BluetoothDevice> foundDevices = [];
  BluetoothDevice selectedDevice;

  void _scanForDevices(FlutterBlue flutterBlue) {
    flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        foundDevices.add(r.device);
      }
    });
    print(foundDevices);
    flutterBlue.stopScan();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Container(
        height: 250.0,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              right: -40.0,
              top: -40.0,
              child: InkResponse(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  child: Icon(Icons.close),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(1.0),
                  child: TextField(
                    onChanged: (value) {
                      deviceName = value;
                    },
                    style: TextStyle(
                      color: Color(0xFF171B0A),
                      fontFamily: waterMeFont,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: waterMeTextColor,
                      icon: Icon(
                        Icons.energy_savings_leaf,
                        color: Color(0xFF2C3C1F),
                      ),
                      hintText: 'New Device Name',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: waterMeFont,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    DropdownButton<BluetoothDevice>(
                        items: foundDevices.map((item) => DropdownMenuItem(
                          value: item,
                            child: Text(
                              item.name,
                              style: dropDownTextStyle,
                            ),
                        )).toList(),
                        onChanged: (item) => setState(() {
                          selectedDevice = item;
                        }),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color.fromRGBO(108, 135, 94, 1),
                      ),
                      child: TextButton(
                        onPressed: () {
                          _scanForDevices(widget.flutterBlue);
                        },
                        child: Text(
                          'Scan',
                          style: TextStyle(
                            fontSize: 25,
                            color: waterMeTextColor,
                            fontFamily: waterMeFont,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color.fromRGBO(108, 135, 94, 1),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, deviceName);
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 25,
                        color: waterMeTextColor,
                        fontFamily: waterMeFont,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
