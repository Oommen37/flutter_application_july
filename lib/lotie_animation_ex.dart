import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MaterialApp(
    home: LottieEx(),
  ));
}

class LottieEx extends StatelessWidget {
  const LottieEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.asset("assets/animations/travel.json", height: 100)
          // child:Lottie.network("https://lottie.host/99319406-9a4f-4bef-9824-21f06caa727e/Ijgwg8mqKU.json"),
          ),
    );
  }
}
