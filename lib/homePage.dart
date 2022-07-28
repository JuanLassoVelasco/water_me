import 'package:flutter/material.dart';
import 'moistureDeviceCard.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _deviceList = [];

  void _addNewDevice() {
    setState(() {
      _deviceList.add(MoistureDeviceCard(deviceName: 'Test Device'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9EA681),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(110, 117, 75, 1),
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _deviceList,
          ),
          Center(
            child: TextButton(
              onPressed: () {
                _addNewDevice();
              },
              child: Container(
                height: 70.0,
                width: 100.0,
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(108, 135, 94, 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  '+',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFF8F0E3),
                    fontSize: 50.0
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