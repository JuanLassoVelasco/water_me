import 'package:flutter/material.dart';

class MoistureDeviceCard extends StatelessWidget {
  MoistureDeviceCard({@required this.deviceName});

  final String deviceName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(108, 135, 94, 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Text(
            deviceName,
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xFFF8F0E3),
            ),
          ),
        ],
      ),
    );
  }
}