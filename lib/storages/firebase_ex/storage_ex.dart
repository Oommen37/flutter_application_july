import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCv1jlxx3uCHWCXqjNc2kvF-cWjEzYCj_w",
          appId: "1:932554889410:android:43c377820fd3905b09435b",
          messagingSenderId: "",
          projectId: "fir-flutter-9736d",
          storageBucket: "fir-flutter-9736d.appspot.com"));
  runApp(MaterialApp(home: Fire_Storage()));
}

class Fire_Storage extends StatefulWidget {
  const Fire_Storage({super.key});

  @override
  State<Fire_Storage> createState() => _Fire_StorageState();
}

class _Fire_StorageState extends State<Fire_Storage> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Storage"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                MaterialButton(
                  onPressed: () => upload("Camera"),
                  child: Text("Camera"),
                  minWidth: 120,
                  height: 40,
                  color: Colors.greenAccent,
                ),
                MaterialButton(
                    onPressed: () => upload("Gallery"),
                    child: Text("Gallery"),
                    minWidth: 120,
                    height: 40,
                    color: Colors.blueAccent)
              ],
            ),
            Expanded(
                child: FutureBuilder(
                    //if firebase connection is success then executes this function
                    future: loadData(),
                    builder: (context,
                        AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                            itemBuilder: (context, index) {});
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }))
          ],
        ));
  }

  loadData() {}

  Future<void> upload(String imageinput) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: imageinput == "Camera"
              ? ImageSource.camera
              : ImageSource.gallery);
      final String filename = path.basename(pickedImage!.path);
      File imagefile = File(pickedImage.path); //relative path
      try {
        await storage.ref(filename).putFile(
            imagefile,
            SettableMetadata(customMetadata: {
              "uploaded_by": "Someone!!",
              "description": "Some Desription.."
            }));
        setState(() {});
      } on FirebaseException catch (e) {
        print(e);
      }
    } catch (e) {
      print(e);
    }
  }
}
