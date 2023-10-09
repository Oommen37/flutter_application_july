import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MaterialApp(
    home: Botomsheet_Ex(),
  ));
}

class Botomsheet_Ex extends StatelessWidget {
  const Botomsheet_Ex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
              onLongPress: () {
                showSheet(context);
              },
              child: Image(image: AssetImage("assets/images/image2.jpg")))),
    );
  }

  void showSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Share Via"),
              Divider(),
              ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                  ),
                  title: Text("Whatsapp")),
              ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.pink,
                  ),
                  title: Text("Instagram"))
            ],
          );
        });
  }
}
