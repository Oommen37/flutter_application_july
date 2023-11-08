import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_july/storages/hive_ex/hive_using_typeadapter/database/hivedb.dart';
import 'package:get/get.dart';

import '../model/users.dart';

class Hive_Reg extends StatelessWidget {
  final name_controller = TextEditingController();
  final email_controller = TextEditingController();
  final pwd_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Registration"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Registration Page"),
              SizedBox(height: 15),
              TextField(
                controller: name_controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Username"),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: email_controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "E-Mail"),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: pwd_controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Password"),
              ),
              MaterialButton(
                onPressed: () async {
                  final userList = await HiveDB.instance.getUsers();
                  validateSignUp(userList);
                  name_controller.clear();
                  email_controller.clear();
                  pwd_controller.clear();
                },
                shape: StadiumBorder(),
                color: Colors.pink,
                child: Text("Register Here"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void validateSignUp(List<Users> userList) async {
    final name = name_controller.text;
    final email = email_controller.text;
    final pswrd = pwd_controller.text;

    bool userExist = false;
    final validateEmail = EmailValidator.validate(email);
    if (name != "" && email != "" && pswrd != "") {
      if (validateEmail == true) {
        await Future.forEach(userList, (user) {
          if (user.email == email) {
            userExist = true;
          } else {
            userExist = false;
          }
        });
        if (userExist == true) {
          Get.snackbar("Error!", "User Already Exist!!!");
        } else {
          final validatePassword = checkPassword(pswrd);
          if (validatePassword == true) {
            //if both email and pass are validuser added to hive
            final user = Users(email: email, password: pswrd, name: name);
            await HiveDB.instance.addUser(user);
            Get.back(); //navigate to login
            Get.snackbar("Success", "User Registration Success");
          }
        }
      } else {
        Get.snackbar("Error", "Enter a valid email.");
      }
    } else {
      Get.snackbar("Error", "Please fill all the fields.");
    }
  }

  bool checkPassword(String pswrd) {
    if (pswrd.length < 6) {
      Get.snackbar("Error!", "Password must have atleast 6 characters");
      return false;
    } else {
      return true;
    }
  }
}
