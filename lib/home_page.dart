import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:timer_image_app/countup.dart';
import 'package:timer_image_app/timer.dart';

import 'countdown.dart';
import 'image.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('あなたの時間')),
      body: Center(
        child: Column(
          children: const [
            Text('現在時刻'),
            ClockTimer(),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.list,
        backgroundColor: Colors.green,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.watch),
            label: 'タイマー',
            backgroundColor: Colors.green,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CountDown();
              }));
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.music_note),
            label: 'ストップウォッチ',
            backgroundColor: Colors.green,
            onTap: () {
              const CountUp();
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.image),
            label: '休憩',
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
