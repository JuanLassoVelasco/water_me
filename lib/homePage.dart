import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'moistureDeviceCard.dart';
import 'addDevicePopup.dart';
import 'constants.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _deviceList = [];
  FlutterBlue flutterBlue = FlutterBlue.instance;

  Future<void> _addNewDevice() async {
    String deviceName;

    deviceName = await _showAddDevicePopup(context);

    if (deviceName != null) {
      setState(() {
        _deviceList.add(MoistureDeviceCard(deviceName: deviceName));
      });
    }
  }

  Future<String> _showAddDevicePopup(BuildContext context) async {
    String deviceName = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddDevicePopup(
          flutterBlue: flutterBlue,
        );
      },
    );

    return deviceName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: waterMeBackgroundColor,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(110, 117, 75, 1),
        title: Text(
          widget.title,
          style: labelTextStyle,
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _deviceList,
          ),
          Center(
            child: Container(
              width: 100.0,
              height: 60.0,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  await _addNewDevice();
                },
                borderRadius: BorderRadius.circular(10.0),
                splashColor: Color(0xFF6E754B),
                highlightColor: Color(0xFF2C3C1F),
                child: Center(
                  child: Ink(
                    height: 60.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(108, 135, 94, 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      '+',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: waterMeTextColor,
                        fontSize: 50.0,
                        fontFamily: waterMeFont,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
