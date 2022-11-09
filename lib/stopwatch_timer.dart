import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerTest extends StatefulWidget {
  const TimerTest({super.key});

  @override
  State<TimerTest> createState() => _TimerTestState();
}

class _TimerTestState extends State<TimerTest> {
  final _stopWatchTimer = StopWatchTimer();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _stopWatchTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('data')),
        body: Column(
          children: [
            StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snapshot) {
                final displayTime = StopWatchTimer.getDisplayTime(
                  snapshot.data!,
                );

                return Center(
                  child: SizedBox(
                    width: 144,
                    child: Text(
                      displayTime,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
                onPressed: () => _stopWatchTimer.onStartTimer(),
                child: const Text('start')),
            ElevatedButton(
                onPressed: () => _stopWatchTimer.onStopTimer(),
                child: const Text('stop')),
            ElevatedButton(
                onPressed: () => _stopWatchTimer.onResetTimer(),
                child: const Text('reset')),
          ],
        ));
  }
}
