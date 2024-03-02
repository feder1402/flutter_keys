import 'package:flutter/material.dart';
import 'package:flutter_keys/components/input_fields/input_fields.dart';
import 'package:flutter_keys/components/separator.dart';
import 'package:flutter_keys/models/contact.dart';

class ContactEditor extends StatefulWidget {
  final Contact? contact;
  final void Function(Contact contact) onSave;

  const ContactEditor({super.key, this.contact, required this.onSave});

  @override
  State<ContactEditor> createState() => _ContactEditorState();
}

class _ContactEditorState extends State<ContactEditor> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    firstNameController =
        TextEditingController(text: widget.contact?.firstName);
    lastNameController = TextEditingController(text: widget.contact?.lastName);
    ageController = TextEditingController(text: widget.contact?.age.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            StringInputField(
              controller: firstNameController,
              hintText: 'First Name',
              maxLength: 30,
              autofocus: true,
            ),
            const Separator(),
            StringInputField(
              controller: lastNameController,
              hintText: 'Last Name',
              maxLength: 30,
            ),
            const Separator(),
            IntegerInputField(
              controller: ageController,
              hintText: 'Age',
            ),
            const Separator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    String? firstName = firstNameController.text;
                    String? lastName = lastNameController.text;
                    int? age = int.tryParse(ageController.text) ?? 0;

                    if (isValidContact(firstName, lastName, age)) {
                      widget.onSave(Contact(
                        firstName: firstName,
                        lastName: lastName,
                        age: age,
                      ));

                      firstNameController.clear();
                      lastNameController.clear();
                      ageController.clear();
                    }
                  },
                  child: Text(widget.contact == null ? 'Save' : 'Update'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void saveContact([
    String firstName = '',
    String lastName = '',
    int age = 0,
  ]) {
    setState(() {
      firstNameController.clear();
      lastNameController.clear();
      ageController.clear();
    });
  }

  bool isValidContact([
    String firstName = '',
    String lastName = '',
    int age = 0,
  ]) =>
      firstName.isNotEmpty && lastName.isNotEmpty && age > 0;
}
