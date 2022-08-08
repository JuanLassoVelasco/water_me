import 'package:flutter/material.dart';
import 'devicePage.dart';
import 'constants.dart';

class MoistureDeviceCard extends StatelessWidget {
  MoistureDeviceCard({@required this.deviceName});

  final String deviceName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DevicePage(deviceName: deviceName);
              },
            ),
          );
        },
        highlightColor: Color(0xFF6E754B),
        splashColor: Color(0xFF2C3C1F),
        borderRadius: BorderRadius.circular(10.0),
        child: Ink(
          height: 100.0,
          decoration: BoxDecoration(
            color: Color.fromRGBO(108, 135, 94, 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                deviceName,
                style: labelTextStyle,
              ),
              Icon(
                Icons.bluetooth_connected_sharp,
                color: waterMeTextColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
