import 'package:flutter/material.dart';
import 'color.dart';

ThemeData buildMentorTheme(theme) {
  final ThemeData base = theme == 1 ? ThemeData.light() : ThemeData.dark();

  final accentColorHolder = kMentorGreen;
  final primaryColorHolder = kMentorGreen;
  final buttonColorHolder = kMentorGreen;
  final scaffoldBackgroundColorHolder = kMentorGreenLight;

  return base.copyWith(
      //Main colors
      accentColor: accentColorHolder,
      primaryColor: primaryColorHolder,
      buttonColor: buttonColorHolder,
      scaffoldBackgroundColor: scaffoldBackgroundColorHolder,
      cardColor: kMentorBackgroundWhite,
      textTheme: buildMentorTextTheme(),
      );
}

TextTheme buildMentorTextTheme() {
  return TextTheme(
    headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.black),
    title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.black),
    body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
    display1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
  );
}

const kSendButtonTextStyle = TextStyle(
  color: kMentorGreenLight,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
