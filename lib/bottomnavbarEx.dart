import 'package:flutter/material.dart';
import 'package:flutter_application_july/fi_card_using_stack.dart';
import 'package:flutter_application_july/gridview_examples/gridview2.dart';
import 'package:flutter_application_july/gridview_examples/gridview4.dart';
import 'package:flutter_application_july/stateful_login.dart';

void main() {
  runApp(MaterialApp(
    home: BottomBarEx(),
  ));
}

class BottomBarEx extends StatefulWidget {
  const BottomBarEx({super.key});

  @override
  State<BottomBarEx> createState() => _BottomBarExState();
}

class _BottomBarExState extends State<BottomBarEx> {
  int index = 0;
  var screens = [FiCard(), GridView2(), GridView4(), Login_stateful()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          //type: BottomNavigationBarType.fixed,
          type: BottomNavigationBarType.shifting,
          //backgroundColor: Colors.green,
          selectedItemColor: Colors.yellow,
          currentIndex: index,
          onTap: (tapedindex) {
            setState(() {
              index = tapedindex; //here index value change according to eah tap
            });
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.home),
                label: "Home"),
            BottomNavigationBarItem(
                backgroundColor: Colors.orange,
                icon: Icon(Icons.add_box_rounded),
                label: "Reels"),
            BottomNavigationBarItem(
                backgroundColor: Colors.teal,
                icon: Icon(Icons.park_rounded),
                label: "Notify"),
            BottomNavigationBarItem(
                backgroundColor: Colors.green,
                icon: Icon(Icons.account_box),
                label: "Profile")
          ]),
      body: screens[index],
    );
  }
}
