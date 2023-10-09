import 'package:flutter/material.dart';
import 'package:flutter_application_july/listview%20example/listview2.dart';
import 'package:flutter_application_july/listview%20example/listview_constructor.dart';
import 'package:flutter_application_july/listview%20example/listview_seperator.dart';
import 'package:flutter_application_july/stateful_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.teal),
    home: AppBar1(),
  ));
}

class AppBar1 extends StatelessWidget {
  const AppBar1({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp"),
          actions: [
            Icon(Icons.camera_alt_outlined),
            SizedBox(width: 15),
            Icon(Icons.search_off_rounded),
            PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text("New Broadcast")),
                PopupMenuItem(child: Text("New Group")),
              ];
            })
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Container(
                      child: Tab(
                        icon: FaIcon(FontAwesomeIcons.users),
                      ),
                      width: MediaQuery.of(context).size.width / 24,
                    ),
                    Tab(
                      text: "Chats",
                    ),
                    Tab(
                      text: "Status",
                    ),
                    Tab(
                      text: "Calls",
                    )
                  ])),
        ),
        body: TabBarView(children: [
          Login_stateful(),
          ListView_Seperated(),
          ListView2(),
          ListView1()
        ]),
      ),
    );
  }
}
