import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('専用タイマーアプリ')),
      body: Column(),
      floatingActionButton: SpeedDial(
        icon: Icons.list,
        backgroundColor: Colors.green,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.watch),
            label: '時間設定',
            backgroundColor: Colors.green,
            onTap: () {},
          ),
          SpeedDialChild(
            child: const Icon(Icons.music_note),
            label: 'music',
            backgroundColor: Colors.green,
            onTap: () {},
          ),
          SpeedDialChild(
            child: const Icon(Icons.image),
            label: 'imge',
            backgroundColor: Colors.green,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
