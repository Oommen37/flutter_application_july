import 'package:flutter/material.dart';
import 'package:flutter_application_july/RegistrationPage.dart';
import 'package:flutter_application_july/home.dart';
import 'package:google_fonts/google_fonts.dart';

class Login_Page extends StatelessWidget {
  String username = "admin@gmail.com";
  String password = "abc123";
  final uname_controller = TextEditingController();
  final pass_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            ///image widgets
            Image.asset(
              //Image(image:)
              "assets/icons/dog.png", //Image.asset()
              height: 80, //Image.network()
              width: 80,
            ),
            Text(
              "MY APP JULY",
              style: GoogleFonts.cabinSketch(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: TextField(
                controller: uname_controller,
                decoration: const InputDecoration(
                    hintText: "UserName",
                    labelText: "Username",
                    helperText: "Username must be an emailid",
                    prefixIcon: Icon(Icons.account_circle),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: TextField(
                obscureText: true,
                controller: pass_controller,
                decoration: const InputDecoration(
                    hintText: "PassWord",
                    labelText: "Password",
                    helperText:
                        "Password must contain special characters,alphabets and numbers",
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (username == uname_controller.text &&
                      password == pass_controller.text) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Invalid Usernam/Password"),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: Text("Login")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegistrationPage()));
                },
                child: Text("Not a User? SignUp Here!!"))
          ],
        ),
      ),
    );
  }
}
