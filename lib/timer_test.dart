import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerTest extends StatefulWidget {
  const TimerTest({super.key});

  @override
  State<TimerTest> createState() => _TimerTestState();
}

class _TimerTestState extends State<TimerTest> {
  final stopWatchTimer = StopWatchTimer(mode: StopWatchMode.countUp);
  final value = StopWatchTimer.getMilliSecFromSecond(60 * 60);
  final raw = 3000; // 3sec

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('data')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        'minute',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Helvetica',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        value.toString(),
                        style: const TextStyle(
                            fontSize: 30,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
            ),
          ],
        ));
  }
}
