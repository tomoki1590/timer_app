import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountUp extends StatefulWidget {
  
  @override
  State<CountUp> createState() => _CountUpState();
}

class _CountUpState extends State<CountUp> {
  late Timer _timer;
  late DateTime _time;

  @override
  void initState() {
    // 初期化処理
    _time = DateTime.utc(0, 0, 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat.Hms().format(_time),
            style: Theme.of(context).textTheme.headline2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  if (_timer.isActive) _timer.cancel();
                },
                child: const Text('停止'),
              ),
              FloatingActionButton(
                onPressed: () {
                  if (_timer.isActive) _timer.cancel();
                },
                child: const Text('reset'),
              ),
              FloatingActionButton(
                  onPressed: () {
                    _timer = Timer.periodic(const Duration(seconds: 60),
                        (Timer timer) {
                      setState(() {
                        _time = _time.add(const Duration(seconds: 60));
                      });
                    });
                  },
                  child: const Text('開始'))
            ],
          )
        ],
      ),
    );
  }
}
