import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

Future<void> _setTime() async {
  tz.initializeTimeZones();
  var tokyo = tz.getLocation('Asia/Tokyo');
  tz.setLocalLocation(tokyo);
}

class _CountDownState extends State<CountDown> with WidgetsBindingObserver {
// //アイコンバッジの初期化
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     // _init();
//   }

  // Future<void> _init() async {
  //   await _localTimeZone();
  //   await _notification();
  // }

  // Future<void> _localTimeZone() async {
  //   tz.initializeTimeZones();
  //   final String currentTimeZone =
  //       await FlutterNativeTimezone.getLocalTimezone();
  //   tz.setLocalLocation(tz.getLocation(currentTimeZone!));
  // }

  // Future<void> _notification() async {

  // }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      FlutterAppBadger.removeBadge();
    }
  }

  int maxSeconds = 0;
  int secounds = 0;
  Timer? timer;
  DateTime timerTime = DateTime(0);

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
        FlutterRingtonePlayer.play(
          android: AndroidSounds.notification,
          ios: IosSounds.alarm,
          looping: true,
          volume: 1.0,
        );
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
          // TextButton(
          //     onPressed: () async {
          //       Picker(
          //           adapter:
          //               DateTimePickerAdapter(type: PickerDateTimeType.kHMS),
          //           title: const Text("時間を設定してください"),
          //           onConfirm: (Picker picker, List value) {
          //             setState(() {
          //               DateTime.utc(0, 0, 0);
          //             });
          //           }).showModal(context);
          //     },
          //     child: const Text('設定'))
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
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                controller: timeController,
              ),
              ElevatedButton(
                  onPressed: () {
                    FlutterRingtonePlayer.play(
                      android: AndroidSounds.notification,
                      ios: IosSounds.alarm,
                      looping: true,
                      volume: 1.0,
                    );

                    maxSeconds = int.parse(timeController.text);
                    startTimer();
                  },
                  child: const Text('start')),
            ],
          );
  }

  Widget buildTime() {
    return Column(
      children: [
        Text('$secounds'),
        Text(DateFormat.Hms().format(timerTime)),
      ],
    );
  }
}
