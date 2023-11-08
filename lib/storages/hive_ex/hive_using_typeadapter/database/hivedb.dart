//singleton class(created using factorynconstructor,it have only single instance
//factory constructor return this instance)

import 'package:flutter_application_july/storages/hive_ex/hive_using_typeadapter/model/users.dart';
import 'package:hive/hive.dart';

class HiveDB {
  HiveDB._internal(); //named constructor

  static HiveDB instance = HiveDB._internal(); //object creation

  //factory constructor
  factory HiveDB() {
    return instance;
  }

  Future<List<Users>> getUsers() async {
    final db = await Hive.openBox<Users>('users');
    return db.values.toList();
  }

  Future<void> addUser(Users user) async {
    final db = await Hive.openBox<Users>('users');
    db.put(user.id, user); //add email name and password to hive
  }
}
