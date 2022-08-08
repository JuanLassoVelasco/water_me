import 'package:flutter/material.dart';
import 'package:water_me/constants.dart';

class AddDevicePopup extends StatefulWidget {
  const AddDevicePopup({Key key}) : super(key: key);

  @override
  State<AddDevicePopup> createState() => _AddDevicePopupState();
}

class _AddDevicePopupState extends State<AddDevicePopup> {
  String deviceName;

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
                    onChanged: (value){
                      deviceName = value;
                    },
                    style: TextStyle(
                      color: Color(0xFF171B0A),
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
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color.fromRGBO(108, 135, 94, 1),
                  ),
                  child: TextButton(
                    onPressed: (){
                      Navigator.pop(context, deviceName);
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 25,
                        color: waterMeTextColor,
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


