import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: SplashPage(),
  ));
}

class SplashPage extends StatelessWidget {
  @override
  // to create our widget tree we use build function
  Widget build(BuildContext context) {
    // BuildContext - used to locate widgets on the widget tree and monitor their actions
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.favorite,
            //   size: 80,
            //   color: Colors.red,
            // ),
            Image(image: AssetImage("assets/icons/dog.png")),
            //  Image(image: NetworkImage("url")),
            Text("MY APPLICATION",
                // style: TextStyle(fontSize: 20, color: Colors.blue))
                style: GoogleFonts.cabinSketch(
                    fontSize: 30,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold)),
          ],
        )));
  }
}
