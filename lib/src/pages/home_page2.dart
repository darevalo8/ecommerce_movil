import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print('holaaaaaaa');
    return Container(
       child: Scaffold(
         body: Text("holaaaa"),
       ),
    );
  }
}