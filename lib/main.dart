import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TimerApp',
      home: const HomePage(),
    );
  }
}

class Statasbar extends StatelessWidget implements PreferredSizeWidget {
  const Statasbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }

  @override
  Size get preferredSize => const Size(0.0, 0.0);
}
