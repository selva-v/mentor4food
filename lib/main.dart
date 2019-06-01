import 'package:flutter/material.dart';
import 'package:mentor4food/ui/shared/theme.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildMentorTheme(1),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mentor Profile"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'http://clipart-library.com/images/BTaroLj5c.png'),
                radius: 70,
              ),
              Column(
                children: <Widget>[
                  Text("Name: Julian Sanders"),
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
    );
  }
}
