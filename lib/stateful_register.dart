import 'package:flutter/material.dart';
import 'package:flutter_application_july/stateful_login.dart';
import 'package:google_fonts/google_fonts.dart';

class Reg_stateful extends StatefulWidget {
  @override
  State<Reg_stateful> createState() => _Reg_statefulState();
}

class _Reg_statefulState extends State<Reg_stateful> {
  final formkey = GlobalKey<FormState>();
  String? pass;
  bool passwordhidden1 = true; //this meas passwrd is hidden
  bool passwordhidden2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const Image(
                image: AssetImage("assets/icons/dog.png"),
                height: 80,
                width: 80,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "MY APP JULY",
                style: GoogleFonts.cabinSketch(
                    fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Name"),
                    validator: (name) {
                      if (name!.isEmpty) {
                        return "Name is a mandatory field";
                      } else {
                        return null;
                      }
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Username"),
                  //here the value entered at text form
                  validator: (uname) {
                    if (uname!.isEmpty ||
                        !uname.contains("@") ||
                        !uname.contains(".com")) {
                      return "Username must not be empty/invalid";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Phone Number"),
                  validator: (num) {
                    if (num!.isEmpty || num.length != 10) {
                      return "Phone Number must not be empty/invalid";
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
                  obscureText: passwordhidden1,
                  validator: (password) {
                    pass = password;
                    if (password!.isEmpty || password.length < 6) {
                      return 'Password must not be empty/ password length must be > 6';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (passwordhidden1 == true) {
                                passwordhidden1 = false;
                              } else {
                                passwordhidden1 = true;
                              }
                            });
                          },
                          icon: Icon(passwordhidden1 == true
                              ? Icons.visibility_off_sharp
                              : Icons.visibility)),
                      border: OutlineInputBorder(),
                      hintText: "Password"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  obscuringCharacter: "*",
                  obscureText: passwordhidden2,
                  validator: (cpassword) {
                    if (cpassword!.isEmpty || cpassword != pass) {
                      return 'Enter same password again';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (passwordhidden2 == true) {
                                passwordhidden2 = false;
                              } else {
                                passwordhidden2 = true;
                              }
                            });
                          },
                          icon: Icon(passwordhidden2 == true
                              ? Icons.visibility_off_sharp
                              : Icons.visibility)),
                      border: OutlineInputBorder(),
                      hintText: "Password"),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    final valid = formkey.currentState!.validate();
                    if (valid) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Login_stateful()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Invalid Data")));
                    }
                  },
                  child: Text("Register"))
            ],
          ),
        ),
      ),
    );
  }
}
