import 'package:flutter/material.dart';
import 'package:pinkeyboard/otpScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.deepPurpleAccent,Colors.deepPurple,
          ],begin: Alignment.topLeft)
        ),
        child: OTPScreen(),
      ),
    );
  }
}
