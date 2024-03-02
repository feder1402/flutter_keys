import 'package:flutter/material.dart';
import 'package:flutter_keys/models/contact.dart';
import 'package:flutter_keys/pages/home_page/sections/contact_list/contact_tile.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contacts;

  const ContactList({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ContactTile(
        contact: contacts[index],
      ),
      itemCount: contacts.length,
    );
  }
}
