import 'package:flutter/material.dart';


class Welcome extends StatefulWidget {
 
  @override
  _Welcome createState() => _Welcome();
}

class _Welcome extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(0)),
            Text('Welcome to Journal'),
          ]
        )
      ),
    );
  }
}