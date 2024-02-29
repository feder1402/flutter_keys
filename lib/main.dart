import 'package:flutter/material.dart';
import 'package:flutter_keys/item.dart';

void main() => runApp(const MaterialApp(
      home: MainApp(),
      debugShowCheckedModeBanner: false,
    ));

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late List<Widget> items;

  @override
  void initState() {
    super.initState();
    items = List.generate(
        10,
        (index) => Item(
              index: index,
              onDeleteItem: deleteItem,
            ));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Items'),
        ),
        body: SafeArea(
          child: items.isNotEmpty
              ? Column(
                  children: items,
                )
              : const Center(
                  child: Text('No items yet!'),
                ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => setState(
        //     () {
        //       items.add(Item(
        //         onDeleteItem: deleteItem,
        //       ));
        //     },
        //   ),
        //   child: const Icon(Icons.add),
        // ),
      );

  void deleteItem(int number) {
    setState(() {
      int index = items
          .indexWhere((element) => element is Item && element.index == number);
      items.removeAt(index);
    });
  }
}
