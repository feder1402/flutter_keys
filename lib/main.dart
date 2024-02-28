import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: MainApp()));

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Widget> tiles = [
    StatelessNameTile(key: UniqueKey(), name: "Mitch"),
    StatelessNameTile(key: UniqueKey(), name: "Sean"),
    StatelessNameTile(key: UniqueKey(), name: "Gus"),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ReorderableListView(
            children: tiles,
            onReorder: (int oldIndex, int newIndex) => setState(
              () {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final Widget tile = tiles.removeAt(oldIndex);
                tiles.insert(newIndex, tile);
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(
            () {
              if (tiles.isNotEmpty) {
                tiles.removeAt(0);
              }
            },
          ),
          child: const Text('Delete'),
        ),
      );
}

class StatelessColorfulTile extends StatelessWidget {
  StatelessColorfulTile({super.key});

  final MaterialColor color =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        height: 100,
      );
}

class StatefulColorfulTile extends StatefulWidget {
  const StatefulColorfulTile({super.key});

  @override
  State<StatefulColorfulTile> createState() => _StatefulColorfulTileState();
}

class _StatefulColorfulTileState extends State<StatefulColorfulTile> {
  MaterialColor color =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 100,
    );
  }
}

class StatelessNameTile extends StatelessWidget {
  final String name;
  StatelessNameTile({super.key, required this.name});

  final MaterialColor color =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        height: 100,
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
