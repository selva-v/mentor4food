import 'dart:io';

import 'package:flutter/material.dart';

class MentorProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mentor Profile"),
        actions: <Widget>[Icon(Icons.chat_bubble)],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage('http://clipart-library.com/images/BTaroLj5c.png'),
                radius: 70,
              ),
              Container(
                height: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ListTile(
                    title: Text("Name:"),
                    subtitle: Text("Julian Sanders"),
                  ),
                  ListTile(
                    title: Text("Reputations:"),
                    subtitle: Text("Super good"),
                  ),
                  ListTile(
                    title: Text("Food Preference:"),
                    subtitle: Text("A&W, Burger King, KFC, Pizza Hut"),
                  ),
                  ListTile(
                    title: Text("Date Available:"),
                    subtitle: Text("2019-06-02"),
                  ),
                  ListTile(
                      title: Text("Technology:"),
                      subtitle: Text("Flutter, Firebase")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
