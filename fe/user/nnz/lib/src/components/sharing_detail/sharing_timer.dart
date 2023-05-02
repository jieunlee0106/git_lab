import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nnz/src/config/config.dart';

class SharingDateTimer extends StatefulWidget {
  final Duration duration;
  final VoidCallback onTimerFinished;

  const SharingDateTimer(
      {Key? key, required this.duration, required this.onTimerFinished})
      : super(key: key);

  @override
  _SharingDateTimerState createState() => _SharingDateTimerState();
}

class _SharingDateTimerState extends State<SharingDateTimer> {
  late Duration _remainingTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.duration;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime = _remainingTime - const Duration(seconds: 1);
        if (_remainingTime.inSeconds <= 0) {
          timer.cancel();
          widget.onTimerFinished();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_remainingTime.inSeconds <= 0) {
      return Text(
        "나눔 받기",
        style: TextStyle(color: Config.blackColor, fontSize: 16),
      );
    }

    final days = _remainingTime.inDays;
    final hours = _remainingTime.inHours % 24;
    final minutes = _remainingTime.inMinutes % 60;
    final seconds = _remainingTime.inSeconds % 60;

    return Text('$days일 $hours시간 $minutes분 $seconds초',
        style: TextStyle(color: Config.blackColor, fontSize: 16));
  }
}
