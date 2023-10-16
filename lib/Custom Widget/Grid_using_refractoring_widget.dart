import 'package:flutter/material.dart';
import 'package:flutter_application_july/Custom%20Widget/refractoring%20widget.dart';

void main() {
  runApp(MaterialApp(
    home: Grid_with_refractoring(),
  ));
}

class Grid_with_refractoring extends StatelessWidget {
  const Grid_with_refractoring({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid with refractoring widget'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
        children: [
          Custom_card(
            image: NetworkImage(
                'https://plus.unsplash.com/premium_photo-1695219819793-159c4258875c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1886&q=80'),
            text: 'my product',
            click: () {},
            click1: () {},
          )
        ],
      ),
    );
  }
}
