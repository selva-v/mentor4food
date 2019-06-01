import 'package:flutter/material.dart';
import 'color.dart';

ThemeData buildMentorTheme(theme) {
  final ThemeData base = theme == 1 ? ThemeData.light() : ThemeData.dark();

  final accentColorHolder = kMentorGreen;
  final primaryColorHolder =kMentorGreen;
  final buttonColorHolder =kMentorGreen;
  final scaffoldBackgroundColorHolder = kMentorBackgroundWhite;
  // final iconColorHolder = kMentorBrown900;

  return base.copyWith(
    //Main colors
    accentColor: accentColorHolder,
    primaryColor: primaryColorHolder,
    buttonColor: buttonColorHolder,
    scaffoldBackgroundColor: scaffoldBackgroundColorHolder,
    cardColor: kMentorBackgroundWhite,
  );
}

TextTheme buildMentorTextTheme(TextTheme base, theme) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 20.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
          fontFamily: 'Rubik');
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