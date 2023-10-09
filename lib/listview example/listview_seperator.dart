import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: ListView_Seperated(),
  ));
}

class ListView_Seperated extends StatelessWidget {
  const ListView_Seperated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView_Seperator"),
      ),
      body: ListView.separated(
          itemBuilder: (ctx, i) {
            return const Card(
              child: FaIcon(FontAwesomeIcons.whatsapp));
          },
          separatorBuilder: (context, index) {
            if (index % 4 == 0) {
              return Divider(color: Colors.red, thickness: 3);
            } else {
              return SizedBox();
            }
          },
          itemCount: 10),
    );
  }
}
