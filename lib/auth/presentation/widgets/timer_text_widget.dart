import 'dart:async';

import 'package:flutter/material.dart';

class TimerTextWidget extends StatefulWidget {
  const TimerTextWidget({Key? key}) : super(key: key);

  @override
  _TimerTextWidgetState createState() => _TimerTextWidgetState();
}

class _TimerTextWidgetState extends State<TimerTextWidget> {
  static const int maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer!.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Через:$seconds сек',
      style: Theme.of(context).textTheme.subtitle2!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Colors.black,
          ),
    );
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }
}
