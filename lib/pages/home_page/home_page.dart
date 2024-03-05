import 'package:flutter/material.dart';
import 'package:flutter_keys/components/page_frame.dart';
import 'package:flutter_keys/models/contact.dart';
import 'package:flutter_keys/pages/home_page/sections/contact_list/contact_list.dart';
import 'package:flutter_keys/pages/home_page/sections/contact_editor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> contacts = [
    Contact(firstName: 'John', lastName: 'Doe', age: 25),
    Contact(firstName: 'Jane', lastName: 'Doe', age: 23),
    Contact(firstName: 'Jimmy', lastName: 'Smith', age: 30),
    Contact(firstName: 'Alice', lastName: 'Smith', age: 28),
    Contact(firstName: 'Bob', lastName: 'Johnson', age: 35),
    Contact(firstName: 'Vicki', lastName: 'Johnson', age: 33),
    Contact(firstName: 'Tommy', lastName: 'Lee', age: 33),
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      title: const Text('Contacts'),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          tooltip: 'Add Contact',
          onPressed: () {
            edit(-1);
          },
        ),
      ],
      child: Column(
        children: [
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
                    onDelete: delete,
                    onEdit: edit,
                  ),
          )
        ],
      ),
    );
  }

  void delete(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  void edit(int index) {
    setState(() {
      selectedIndex = index;
    });
    var contact =
        contacts.isEmpty || selectedIndex == -1 ? null : contacts[index];
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContactEditor(
          key: ValueKey(contact),
          contact: contact,
          onSave: onSaveContact,
        ),
      ),
    );
  }

  onSaveContact(contact) {
    Navigator.of(context).pop();
    if (selectedIndex != -1) {
      setState(() {
        contacts[selectedIndex] = contact;
        selectedIndex = -1;
      });
      return;
    }
    setState(() {
      contacts.add(contact);
    });
  }
}
