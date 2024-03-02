import 'package:flutter/material.dart';
import 'package:flutter_keys/app_theme.dart';
import 'package:flutter_keys/pages/home_page/home_page.dart';

void main() => runApp(MaterialApp(
      title: 'Contact List Mnager',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const HomePage(),
    ));
