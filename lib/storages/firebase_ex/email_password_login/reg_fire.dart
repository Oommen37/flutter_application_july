import 'package:flutter/material.dart';
import 'package:flutter_application_july/storages/firebase_ex/email_password_login/firebase_helper.dart';
import 'package:flutter_application_july/storages/firebase_ex/email_password_login/login_fire.dart';

class Reg_Fire extends StatelessWidget {
  final R_Uname = TextEditingController();
  final R_Pass = TextEditingController();
  final R_Name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Register'),
      ),
      body: Column(
        children: [
          Text(
            'Hello! Register Here!!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: R_Name,
            decoration:
                InputDecoration(border: OutlineInputBorder(), hintText: 'Name'),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: R_Uname,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Username'),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: R_Pass,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Password'),
          ),
          SizedBox(
            height: 15,
          ),
          MaterialButton(
              onPressed: () {
                final email = R_Uname.text.trim();
                final pswd = R_Pass.text.trim();
                FireBaseHelper()
                    .register(email: email, password: pswd)
                    .then((value) {
                  if (value == null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login_Fire()));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(value)));
                  }
                });
              },
              child: Text('Register'),
              height: 70,
              minWidth: 120)
        ],
      ),
    );
  }
}
