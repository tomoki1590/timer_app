import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockTimer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClockTimerState();
  }
}

class _ClockTimerState extends State<ClockTimer> {
  String _time = '';

  @override
  void initState() {
    super.initState();

    /// Timer.periodic は繰り返し実行する時に使うメソッド
    Timer.periodic(Duration(seconds: 1), _onTimer);
  }

  void _onTimer(Timer timer) {
    /// 現在時刻を取得する
    var now = DateTime.now();

    /// 「時:分:秒」表記に文字列を変換するdateFormatを宣言する
    var dateFormat = DateFormat('HH:mm:ss');

    /// nowをdateFormatでstringに変換する
    var timeString = dateFormat.format(now);
    setState(() => {_time = timeString});
  }

  @override
  Widget build(BuildContext context) {
    return Text(_time);
  }
}
