import 'package:flutter/material.dart';
import 'package:flutter_keys/models/contact.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;
  final void Function() onDelete;
  final void Function() onEdit;

  const ContactTile(
      {super.key,
      required this.contact,
      required this.onDelete,
      required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          onTap: onEdit,
          leading: CircleAvatar(
            child: Text(
              '${contact.firstName[0]}${contact.lastName[0]}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(
            '${contact.firstName} ${contact.lastName}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(contact.age.toString()),
          trailing: IconButton(
            tooltip: 'Delete',
            onPressed: onDelete,
            icon: const Icon(Icons.delete),
          )),
    );
  }
}
