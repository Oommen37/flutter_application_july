import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_july/storages/firebase_ex/email_password_login/firebase_helper.dart';
import 'package:flutter_application_july/storages/firebase_ex/email_password_login/home_fire.dart';
import 'package:flutter_application_july/storages/firebase_ex/email_password_login/reg_fire.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCv1jlxx3uCHWCXqjNc2kvF-cWjEzYCj_w",
          appId: "1:932554889410:android:43c377820fd3905b09435b",
          messagingSenderId: "",
          projectId: "fir-flutter-9736d"));
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(home: user == null ? Login_Fire() : Home_Fire()));
}

class Login_Fire extends StatelessWidget {
  final L_Uname = TextEditingController();
  final L_Pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Login'),
      ),
      body: Column(
        children: [
          Text(
            'Hello! Login Here!!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: L_Uname,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Username'),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: L_Pass,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Password'),
          ),
          SizedBox(
            height: 15,
          ),
          MaterialButton(
            onPressed: () {
              final email = L_Uname.text.trim();
              final pswd = L_Pass.text.trim();
              FireBaseHelper()
                  .login(email: email, password: pswd)
                  .then((value) {
                if (value == null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home_Fire()));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(value)));
                }
              });
            },
            child: Text('Login'),
            height: 70,
            minWidth: 120,
          ),
          SizedBox(
            height: 15,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Reg_Fire()));
              },
              child: Text('Not user? Register here!'))
        ],
      ),
    );
  }
}
