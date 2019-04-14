import 'package:flutter/material.dart';
import 'package:contacts_app/screens/contactlist.dart';

void main() {
  runApp(ContactsApp());
}
    
class ContactsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contacts",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
        scaffoldBackgroundColor: Colors.white,
        accentColor: Colors.tealAccent
      ),
      home: ContactList(),
    );
  }

}