import 'package:flutter/material.dart';
import 'homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(110, 117, 75, 1),
        backgroundColor: Color(0xFF9EA681),
        buttonTheme: ButtonThemeData(
          buttonColor: Color.fromRGBO(108, 135, 94, 1),
        ),
        dialogBackgroundColor: Color(0xFF9EA681),
      ),
      home: MyHomePage(title: 'Water Me Devices'),
    );
  }
}
