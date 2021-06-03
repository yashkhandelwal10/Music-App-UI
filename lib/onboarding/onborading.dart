import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:vikrant_app/homepage/homepage.dart';
//import 'package:introduction_screen/introduction_screen.dart';
//import 'package:introduction_screen/introduction_screen.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Music makes you love everyone',
              body: 'A man who never lives a life',
              image: buildImage('images/pop.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Music gives you inspiration',
              body: 'A man who never lives a life',
              image: buildImage('images/hiphop.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Leave stress by listening to it',
              body: 'A man who never lives a life',
              image: buildImage('images/country.jpg'),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text(
            'Read',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          onSkip: () => goToHome(context),
          next: Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Colors.lightGreen.shade200,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );

  Widget buildImage(String path) => Center(
          child: Image.asset(
        path,
        width: 350,
      ));
  DotsDecorator getDotDecoration() => DotsDecorator(
      color: Colors.lightBlue,
      size: Size(10, 10),
      activeSize: Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ));

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
