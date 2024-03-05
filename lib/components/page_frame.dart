import 'package:flutter/material.dart';

class PageFrame extends StatelessWidget {
  final Widget child;
  final Widget? title;
  final List<Widget>? actions;

  const PageFrame({super.key, required this.child, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: actions,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
