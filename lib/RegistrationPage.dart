import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Registration Form"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/icons/dog.png"),
              height: 80,
              width: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "MY APP JULY",
              style: GoogleFonts.cabinSketch(
                  fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Name",
                    labelText: "Name",
                    prefixIcon: Icon(Icons.account_circle_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    fillColor: Colors.grey.shade200,
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Phone",
                    labelText: "Phone",
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    fillColor: Colors.grey.shade200,
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "UserName",
                    labelText: "UserName",
                    prefixIcon: Icon(Icons.account_circle_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    fillColor: Colors.grey.shade200,
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "PassWord",
                    labelText: "PassWord",
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    fillColor: Colors.grey.shade200,
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Confirm PassWord",
                    labelText: "Confirm PassWord",
                    prefixIcon: Icon(Icons.password_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    fillColor: Colors.grey.shade200,
                    filled: true),
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
