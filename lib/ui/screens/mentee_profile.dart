import 'package:flutter/material.dart';
import 'package:mentor4food/ui/shared/theme.dart';

class MenteePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mentee Profile"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 30,
              ),
              CircleAvatar(
                backgroundImage:
                    NetworkImage('https://picsum.photos/310/203?random'),
                radius: 70,
              ),
              Container(
                height: 40,
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Name: Alex Jones",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 20,
                  ),
                  Text("Reputations: *******"),
                  Text("Food Preference: *******"),
                  Text("Date Available: *******"),
                  Text("Technology: *******"),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
