import 'package:flutter/material.dart';
import 'package:flutter_keys/models/contact.dart';
import 'package:flutter_keys/pages/home_page/sections/contact_list/contact_tile.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contacts;
  final void Function(int index) onDelete;
  final void Function(int index) onEdit;

  const ContactList({
    super.key,
    required this.contacts,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: buildItemWidget,
      itemCount: contacts.length,
    );
  }

  Widget buildItemWidget(BuildContext context, int index) {
    return ContactTile(
      contact: contacts[index],
      onDelete: () {
        onDelete(index);
      },
      onEdit: () {
        onEdit(index);
      },
    );
  }
}
