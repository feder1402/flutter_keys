import 'dart:math';

import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final int index;
  final void Function(int number) onDeleteItem;

  const Item({super.key, required this.onDeleteItem, required this.index});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool isChecked = false;
  int itemNumber = Random().nextInt(1000);
  String task = '';

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
            leading: Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
            ),
            title: Text('Todo $itemNumber'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                widget.onDeleteItem(widget.index);
              },
            )),
      );
}
