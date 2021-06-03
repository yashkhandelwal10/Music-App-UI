import 'package:flutter/material.dart';
import 'package:vikrant_app/Music_screens/nowplaying.dart';
//import 'package:vikrant_app/login_signup/login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0,
            foregroundColor: Colors.white,
          ),
          accentColor: Colors.green,
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 22.0, color: Colors.green),
              headline2: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: Colors.green,
              ),
              bodyText1: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.redAccent,
              ))),
      home: NowPlaying(),
    );
  }
}
