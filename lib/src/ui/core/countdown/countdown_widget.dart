import 'dart:async';

import 'package:flutter/material.dart';

class CountdownWidget extends StatefulWidget {

  final TextStyle textStyle;
  final Duration duration;

  const CountdownWidget({
     super.key, 
     required this.textStyle, 
     required this.duration,
  });

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {

  final countDownVN = ValueNotifier<Duration>(Duration.zero);
  late DateTime endTime;
  late Timer timer;

  @override
  void initState() {
    endTime = DateTime.now().add(widget.duration);
    countDownVN.value = endTime.difference(DateTime.now());
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final restTime = endTime.difference(DateTime.now());

      if(restTime > Duration.zero){
        countDownVN.value = restTime;
      } else {
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return ValueListenableBuilder(
          valueListenable: countDownVN,
          builder: (_, countDownVNValue, _) {
            final minutes = countDownVNValue.inMinutes.toString().padLeft(2, '0');
            final seconds = countDownVNValue.inSeconds.remainder(60).toString().padLeft(2, '0');

              return Text(
              '$minutes:$seconds',
              style: widget.textStyle,
            );
          },
      );
  }
}