import 'package:flutter/material.dart';
import 'package:flutter_application_july/storages/sqflite_ex/sqflite_crud/sql_functions.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Contact_Book(),
  ));
}

class Contact_Book extends StatefulWidget {
  const Contact_Book({super.key});

  @override
  State<Contact_Book> createState() => _Contact_BookState();
}

class _Contact_BookState extends State<Contact_Book> {
  List<Map<String, dynamic>> contacts = [];
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: isLoading
          ? Text(
              'Create new contact',
              style: GoogleFonts.caesarDressing(fontSize: 25),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.person,
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                      ),
                    ),
                    title: Text(contacts[index]['cname']),
                    subtitle: Text(contacts[index]['cnumber']),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          onPressed: () => showSheet(contacts[index]["id"]),
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                            onPressed: () =>
                                deleteContact(contacts[index]["id"]),
                            icon: Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showSheet(null),
        child: Icon(Icons.person_add),
      ),
    );
  }

  final name_controller = TextEditingController();
  final num_controller = TextEditingController();
  void showSheet(int? id) {
    if (id != null) {
      final existingcontact =
          contacts.firstWhere((element) => element["id"] == id);
      name_controller.text = existingcontact["cname"];
      num_controller.text = existingcontact["cnumber"];
    }
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 120),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: name_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name'),
                ),
                TextField(
                  controller: num_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'number'),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (id == null) {
                        createcontact(
                            name_controller.text, num_controller.text);
                      }
                      if (id != null) {
                        updateContact(id);
                      }
                      name_controller.text = '';
                      num_controller.text = '';
                      Navigator.of(context).pop();
                    },
                    child:
                        Text(id == null ? 'create contact' : 'update contact'))
              ],
            ),
          );
        });
  }

  Future<void> createcontact(String name, String number) async {
    await SQL_Functions.addnewContact(name, number);
  }

  @override
  void initState() {
    readContact_and_refresh_ui();
    super.initState();
  }

  Future<void> readContact_and_refresh_ui() async {
    final mycontacts = await SQL_Functions.readContact();
    setState(() {
      contacts = mycontacts;
      isLoading = false;
    });
  }

  Future<void> updateContact(int id) async {
    await SQL_Functions.updateContactt(
        id, name_controller.text, num_controller.text);
    readContact_and_refresh_ui();
  }

  Future<void> deleteContact(int id) async {
    await SQL_Functions.removeContact(id);
    readContact_and_refresh_ui();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Successfully Deleted"),
    ));
  }
}
