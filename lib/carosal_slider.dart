import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_july/fi_card_using_stack.dart';

void main() {
  runApp(const MaterialApp(
    home: Car_Slider(),
  ));
}

class Car_Slider extends StatelessWidget {
  const Car_Slider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: CarouselSlider(
          items: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => FiCard()));
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/image1.jpg")),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/image2.jpg"))),
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/image3.jpg"))),
            )
          ],
          options: CarouselOptions(
              autoPlay: true,
              viewportFraction: .5,
              height: 200,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlayCurve: Curves.linear,
              autoPlayAnimationDuration: Duration(seconds: 2))),
    );
  }
}
