import 'package:flutter/material.dart';
import 'package:water_me/constants.dart';
import 'constants.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({Key key, @required this.deviceName}) : super(key: key);

  final String deviceName;

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: waterMeBackgroundColor,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: waterMeButtonColor,
                    child: Icon(
                      Icons.arrow_back,
                      color: waterMeTextColor,
                    ),
                  ),
                ),
                Text(
                  widget.deviceName,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: waterMeTextColor,
                    fontFamily: waterMeFont,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Moisture Level:',
                  style: labelTextStyle,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.water_drop_sharp,
                      color: waterMeTextColor,
                    ),
                    Text(
                      '100.0 %',
                      style: labelTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
