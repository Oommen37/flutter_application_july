import 'package:flutter/material.dart';
import 'package:flutter_application_july/home.dart';
import 'package:flutter_application_july/stateful_register.dart';
import 'package:google_fonts/google_fonts.dart';

class Login_stateful extends StatefulWidget {
  @override
  State<Login_stateful> createState() => _Login_statefulState();
}

class _Login_statefulState extends State<Login_stateful> {
  String username = "admin@gmail.com";
  String pass = "abc123";
  final key1 = GlobalKey<FormState>();
  bool passwordhidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: key1,
          child: Column(
            children: [
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
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Username"),
                  //here the value entered at text form
                  validator: (uname) {
                    if (uname!.isEmpty || uname != username) {
                      return "Username must not be empty/invalid";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  obscuringCharacter: "*",
                  obscureText: passwordhidden,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (passwordhidden == true) {
                                passwordhidden = false;
                              } else {
                                passwordhidden = true;
                              }
                            });
                          },
                          icon: Icon(passwordhidden == true
                              ? Icons.visibility_off_sharp
                              : Icons.visibility)),
                      border: OutlineInputBorder(),
                      hintText: "Password"),
                  validator: (password) {
                    if (password!.isEmpty || password != pass) {
                      return 'Password must not be empty/ password length must be > 6';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    final valid = key1.currentState!.validate();
                    if (valid) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Invalid Data")));
                    }
                  },
                  child: Text("Login")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Reg_stateful()));
                  },
                  child: Text("Not a User? SignUp Here!!"))
            ],
          ),
        ),
      ),
    );
  }
}
