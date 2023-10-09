import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: ListView1(),
  ));
}

class ListView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView 1"),
      ),
      body: ListView(
        children: [
          Card(
              child: ListTile(
            leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/image2.jpg")),
            title: Text("Product 1"),
            subtitle: Row(
              children: [
                Text("This is sample subtitle"),
              ],
            ),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("10:11"),
                CircleAvatar(
                  minRadius: 6,
                  maxRadius: 10,
                  backgroundColor: Colors.green,
                  child: Text("2"),
                )
              ],
            ),
          )),
          Card(
              child: ListTile(
            leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/image2.jpg")),
            title: Text("Product 2"),
            subtitle: Text("This is sample subtitle"),
            trailing: Text("10:19"),
          )),
          Card(
              child: ListTile(
            leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/image2.jpg")),
            title: Text("Product 3"),
            subtitle: Text("This is sample subtitle"),
            trailing: Text("10:11"),
          )),
          Card(
              child: ListTile(
            leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/image2.jpg")),
            title: Text("Product 4"),
            subtitle: Text("This is sample subtitle"),
            trailing: Text("10:11"),
          )),
          Card(
              child: ListTile(
            leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/image2.jpg")),
            title: Text("Product 5"),
            subtitle: Text("This is sample subtitle"),
            trailing: Text("10:11"),
          ))
        ],
      ),
    );
  }
}
