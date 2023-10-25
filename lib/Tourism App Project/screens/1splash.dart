import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_july/Tourism%20App%20Project/screens/2login_ignup.dart';
import 'package:flutter_application_july/Tourism%20App%20Project/screens/3login.dart';
import 'package:flutter_application_july/Tourism%20App%20Project/screens/4signup.dart';
import 'package:flutter_application_july/Tourism%20App%20Project/screens/5home.dart';
import 'package:flutter_application_july/Tourism%20App%20Project/screens/6details.dart';
import 'package:flutter_application_july/Tourism%20App%20Project/screens/7explorenow.dart';
import 'package:flutter_application_july/Tourism%20App%20Project/screens/8payments.dart';

void main() {
  runApp(MaterialApp(
    home: Introscreen(),
    routes: {
      'login': (context) => Tour_login(),
      'register': (context) => Tour_signup(),
      'home': (context) => Tour_home(),
      'details': (context) => Tour_details(),
      'explore': (context) => Tour_explore(),
      'payment': (context) => Tour_payment(),
    },
  ));
}

class Introscreen extends StatefulWidget {
  const Introscreen({super.key});

  @override
  State<Introscreen> createState() => _IntroscreenState();
}

class _IntroscreenState extends State<Introscreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Login_signup()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/travel.png', height: 250, width: 250),
      ),
    );
  }
}
