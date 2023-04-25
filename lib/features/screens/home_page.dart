import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BodyPower"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        width: 400,
        height: 100,
        color: Colors.red,
      ),
    );
  }
}
