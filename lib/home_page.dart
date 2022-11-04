import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:timer_image_app/timer.dart';

import 'countdown.dart';
import 'image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required String title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('あなたの時間')),
      body: Column(
        children: [ClockTimer(), const Text('erro')],
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.list,
        backgroundColor: Colors.green,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.watch),
            label: '時間設定',
            backgroundColor: Colors.green,
            onTap: () {
              const CountDown();
            },
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
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ImagePage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
