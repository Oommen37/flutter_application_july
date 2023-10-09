import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_july/stateful_login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Splash2(),
  ));
}

class Splash2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      Splash2State(); //define an initial state for the page
}

class Splash2State extends State {
  @override
  void initState() {
    //what happens when the page is loaded
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Login_stateful()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.green, Colors.white12, Colors.black12])),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/icons/dog.png"),
                  width: 100,
                  height: 100,
                ),
                Text("MY APP JULY",
                    style: GoogleFonts.cabinSketch(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ],
            ))));
  }
}
