import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ListView2(),
  ));
}

class ListView2 extends StatelessWidget {
  var title = [
    "Data1",
    "Data2",
    "Data3",
    "Data4",
    "Data5",
    "Data6",
    "Data7",
    "Data8"
  ];
  var subtitle = ["120", "340", "40", "700", "25", "30", "500", "200"];
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
      appBar: AppBar(
        title: Text("ListView2"),
      ),
      body: ListView(
        children: List.generate(
            8,
            (index) => Card(
                  child: ListTile(
                    title: Text(title[index]),
                    subtitle: Text("${subtitle[index]}"),
                    leading: CircleAvatar(child: Image.asset(images[index])),
                  ),
                )),
      ),
    );
  }
}
