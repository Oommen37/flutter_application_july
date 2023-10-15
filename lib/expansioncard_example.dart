import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ExpansionTileEX(),
  ));
}

class ExpansionTileEX extends StatelessWidget {
  const ExpansionTileEX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EXPANSION TILE"),
      ),
      body: Column(
        children: [
          ExpansionTile(
            title: Text('colors'),
            subtitle: Text('Expand to view more...'),
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                ),
                title: Text('Pink'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                ),
                title: Text('Green'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.yellow,
                ),
                title: Text('Yellow'),
              )
            ],
          ),
          ExpansionTile(
            title: Text('colors'),
            subtitle: Text('Expand to view more...'),
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                ),
                title: Text('Pink'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                ),
                title: Text('Green'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.yellow,
                ),
                title: Text('Yellow'),
              )
            ],
          )
        ],
      ),
    );
  }
}
