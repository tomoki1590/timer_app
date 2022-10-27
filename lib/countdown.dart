import 'dart:async';

import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  static const maxMinutes = 60;
  static const maxSeconds = 60;
  int minutes = maxMinutes;
  int secounds = maxSeconds;
  Timer? timer;

  void resetTimer() {
    setState(() {
      secounds = maxSeconds;
      minutes = maxMinutes;
    });
  }

  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secounds > 0) {
        setState(() {
          secounds--;
        });
      } else {
        stopTimer(reset: false);
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    setState(() {
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: buildTime()),
          Center(child: buildButtons()),
        ],
      ),
    );
  }

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleated = secounds == maxSeconds || secounds == 0;

    return isRunning || !isCompleated
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (isRunning) {
                    stopTimer(reset: false);
                  } else {
                    startTimer(reset: false);
                  }
                },
                child: Text(isRunning ? 'Pause' : 'resume'),
              ),
              ElevatedButton(
                onPressed: () {
                  stopTimer();
                },
                child: const Text('cancel'),
              ),
            ],
          )
        : ElevatedButton(
            onPressed: () {
              startTimer();
            },
            child: const Text('start'));
  }

  Widget buildTime() {
    return Text('$minutes' ":" '$secounds');
  }
}
