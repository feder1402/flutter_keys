import 'package:flutter/material.dart';
import 'package:flutter_keys/models/contact.dart';
import 'package:flutter_keys/pages/home_page/sections/contact_list/contact_list.dart';
import 'package:flutter_keys/pages/home_page/sections/edit_contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> contacts = List.empty(growable: true);

  onSaveContact(contact) {
    setState(() {
      contacts.add(contact);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ContactEditor(
                  contact: contacts.isEmpty ? null : contacts.first,
                  onSave: onSaveContact,
                ),
                Expanded(
                  child: contacts.isEmpty
                      ? const Center(
                          child: Text(
                            'No contacts found',
                            style: TextStyle(fontSize: 22),
                          ),
                        )
                      : ContactList(
                          contacts: contacts,
                        ),
                )
              ],
            ),
          ),
        ),
      );
}
