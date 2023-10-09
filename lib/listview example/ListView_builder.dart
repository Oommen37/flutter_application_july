import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: ListView_Builder(),
  ));
}

class ListView_Builder extends StatelessWidget {
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
        title: Text("ListView Builder"),
      ),
      body: ListView.builder(
          //used when we dont know the no of list entries
          itemCount: 8,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("hello"),
                subtitle: Text("mydata"),
                leading: Image.asset(images[index]),
                trailing: Icon(Icons.shopping_cart),
              ),
            );
          }),
    );
  }
}
