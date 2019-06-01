import 'package:flutter/material.dart';
import 'package:mentor4food/ui/screens/mentee_profile.dart';
import 'package:mentor4food/ui/screens/mentor_profile.dart';
import 'package:mentor4food/ui/screens/new_mentee.dart';
import 'package:mentor4food/ui/shared/color.dart';
import 'package:mentor4food/ui/shared/theme.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
    theme: buildMentorTheme(1),
    routes: {
      '/mentee': (context) => MenteePage(),
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: NewMentee(),
      title: Text(
        'MENTOR FOR FOOD',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image.asset(
          'assets/giphy.gif'),
      backgroundColor: kMentorGreenLight,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: kMentorGreen,
    );
  }
}
