import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridView3(),
  ));
}

class GridView3 extends StatelessWidget {
  var images = [
    "assets/images/f1.jpg",
    "assets/images/f2.jpg",
    "assets/images/f3.jpg",
    "assets/images/f4.jpg",
    "assets/images/f5.jpg",
    "assets/images/f6.jpg",
    "assets/images/f7.jpg",
    "assets/images/f8.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(
                8,
                (index) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            images[index],
                            height: 100,
                          ),
                          const Text(
                            "Food 1",
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text(
                            "120 \$",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ))),
      ),
    );
  }
}
