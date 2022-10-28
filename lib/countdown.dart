import 'dart:async';

import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  int maxSeconds = 60;
  int secounds = 60;
  Timer? timer;

  void resetTimer() {
    setState(() {
      secounds = maxSeconds;
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
    final timeController = TextEditingController();

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
                child: const Text('reset'),
              )
            ],
          )
        : Column(
            children: [
              TextField(
                //Textを用いて秒数を決定
                decoration: const InputDecoration(
                    hintText: '秒数を入力してください', filled: true),
                keyboardType: TextInputType.number,
                controller: timeController,
              ),
              ElevatedButton(
                  onPressed: () {
                    maxSeconds = int.parse(timeController.text);
                    startTimer();
                  },
                  child: const Text('start')),
            ],
          );
  }

  Widget buildTime() {
    return Text('$secounds');
  }
}
