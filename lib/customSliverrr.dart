import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: SliverEx(),
  ));
}

class SliverEx extends StatelessWidget {
  const SliverEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            title: Text("Sliver Example"),
            bottom: AppBar(
              elevation: 0,
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                width: double.infinity,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      suffixIcon: Icon(Icons.camera_alt_outlined),
                      prefixIcon: Icon(Icons.search_rounded)),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) => Card(
                    child: ListTile(
                      leading: Icon(Icons.account_balance),
                      title: Text("Name"),
                      subtitle: Text("9898845443"),
                    ),
                  )))
        ],
      ),
    );
  }
}
