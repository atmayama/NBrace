import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(OrthoApp());
}

class OrthoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NBrace",
      initialRoute: "/",
      routes: {
        "/": (context) {
          return AppHome();
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blueAccent,
        fontFamily: "Raleway",
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.blueAccent),
          color: Colors.white,
          elevation: 0,
          textTheme: TextTheme(
            title: TextStyle(
                color: Colors.blueAccent,
                fontSize: 23,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w300),
          ),
        ),
        textTheme: TextTheme(

            title: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            headline: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
            subhead: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
            body1: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            subtitle: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            body2: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
      ),
    );
  }
}
