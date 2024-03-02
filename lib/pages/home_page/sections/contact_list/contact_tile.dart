import 'package:flutter/material.dart';
import 'package:flutter_keys/models/contact.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;

  const ContactTile({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${contact.firstName[0]}${contact.lastName[0]}'),
        ),
        title: Text('${contact.firstName} ${contact.lastName}'),
        subtitle: Text(contact.age.toString()),
      ),
    );
  }
}
