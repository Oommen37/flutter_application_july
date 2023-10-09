import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MaterialApp(
    home: StaggeredGriddd(),
  ));
}

class StaggeredGriddd extends StatelessWidget {
  const StaggeredGriddd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staggered Grid View"),
      ),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.green,
                  child: Center(
                    child: Icon(Icons.access_alarm_outlined),
                  ),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.orange,
                  child: Center(
                    child: Icon(Icons.e_mobiledata),
                  ),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child: Card(
                  color: Colors.yellow,
                  child: Center(
                    child: Icon(Icons.dangerous_outlined),
                  ),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.red,
                  child: Center(
                    child: Icon(Icons.baby_changing_station),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
