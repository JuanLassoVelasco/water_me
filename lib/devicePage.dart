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
      appBar: AppBar(
        title: Text(
          widget.deviceName,
        ),
      ),
      backgroundColor: waterMeBackgroundColor,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              widget.deviceName,
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
          ),
          Container(
            child: Row(
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
          )
        ],
      ),
    );
  }
}

