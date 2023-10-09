import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() {
  runApp(MaterialApp(
    home: FiCard(),
  ));
}

class FiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 250,
              width: 400,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.teal),
            ),
            Positioned(
              top: 80,
              left: 30,
              child: Row(
                children: [
                  Transform.rotate(
                      angle: 90 * math.pi / 180,
                      child: const FaIcon(FontAwesomeIcons.simCard,
                          size: 40, color: Colors.grey)),
                  SizedBox(width: 10),
                  Transform.rotate(
                      angle: 90 * math.pi / 180,
                      child: const FaIcon(FontAwesomeIcons.wifi,
                          size: 30, color: Colors.grey)),
                ],
              ),
            ),
            Positioned(
                top: 200,
                left: 20,
                child: Text(
                  "Oommen",
                  style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.grey),
                )),
            Positioned(
                top: 200,
                left: 320,
                child: Text(
                  "VISA",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )),
            Positioned(
                top: 20,
                left: 320,
                child: GradientText(
                  "Fi",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: [Colors.black38, Colors.white38, Colors.black26],
                  gradientDirection: GradientDirection.ttb,
                )),
          ],
        ),
      ),
    );
  }
}
