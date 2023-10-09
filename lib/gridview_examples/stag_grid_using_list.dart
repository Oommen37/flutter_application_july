import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MaterialApp(
    home: StaggeredGriddd2(),
  ));
}

class StaggeredGriddd2 extends StatelessWidget {
  StaggeredGriddd2({super.key});
  var crosscount = [2, 3, 1, 2, 3, 2, 1, 3, 1, 2];
  var maincount = [1, 2, 2, 2, 1, 2, 3, 1, 2, 1];
  var image = [
    "assets/images/f1.jpg",
    "assets/images/f2.jpg",
    "assets/images/f3.jpg",
    "assets/images/f4.jpg",
    "assets/images/f5.jpg",
    "assets/images/f6.jpg",
    "assets/images/f7.jpg",
    "assets/images/f8.jpg",
    "assets/images/f1.jpg",
    "assets/images/f1.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staggered Grid View"),
      ),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
            crossAxisCount: 4,
            children: List.generate(
                10,
                (index) => StaggeredGridTile.count(
                    crossAxisCellCount: crosscount[index],
                    mainAxisCellCount: maincount[index],
                    child: Card(
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: Image.asset(image[index]),
                    )))),
      ),
    );
  }
}
