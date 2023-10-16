import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom_card extends StatelessWidget {
  NetworkImage? image;
  String? text;
  IconData? icon;
  VoidCallback? click;
  VoidCallback? click1;
  Custom_card(
      {required this.image,
      required this.text,
      this.icon,
      required this.click,
      required this.click1});

  @override
  Widget build(BuildContext context) {
    return Card(
      ///return card/anything you want
      child: Column(
        children: [
          Stack(children: [
            Image(
              image: image!,
              height: 300,
            )
          ]),
          Text(
            text!,
            style: GoogleFonts.montserrat(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          //Icon(icon!, size: 15,color: Colors.white,),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: click,
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  )),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(onPressed: click1, child: Text('Buy now'))
            ],
          )
        ],
      ),
    );
  }
}
