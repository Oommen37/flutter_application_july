import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(
    home: permis(),
  ));
}

class permis extends StatelessWidget {
  const permis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Permission Handler"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: requestCameraPermission,
                    child: Text(
                      "Request Camera Permission",
                      style: TextStyle(fontSize: 16),
                    )),
                ElevatedButton(
                    onPressed: requestPerWithOpenSettings,
                    child: Text(
                      "Open Permission Settings",
                      style: TextStyle(fontSize: 16),
                    ))
              ],
            ),
          ),
        ));
  }

  void requestCameraPermission() async {
    /// status can either be: granted, denied, restricted or permanentlyDenied
    var status = await Permission.camera.status;
    if (status.isGranted) {
      print("Permission is granted");
    } else if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      if (await Permission.camera.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
        print("Permission was granted");
      }
    }

    // You can can also directly ask the permission about its status.
    // if (await Permission.location.isRestricted) {
    //   // The OS restricts access, for example because of parental controls.
    // }
  }

  void requestPerWithOpenSettings() {
    //if (await Permission.speech.isPermanentlyDenied) {
    openAppSettings();
    //}
  }
}
