import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridView1(),
  ));
}

class GridView1 extends StatelessWidget {
  const GridView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView1"),
      ),
      body: GridView(
          //this is to show how items will be placed in cross axis
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          children: List.generate(
              15,
              (index) => Card(
                    color: Colors.primaries[index %
                        Colors.primaries.length], //generates random colors
                    child: Icon(Icons.add),
                  ))),
    );
  }
}
