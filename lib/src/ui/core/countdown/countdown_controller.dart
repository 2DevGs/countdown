import 'dart:async';
import 'package:flutter/material.dart';

class CountdownController extends ValueNotifier<Duration> {

  DateTime? _endTime;
  final Duration _countDownDuration;
  final VoidCallback? _onEnd;
  var _started = false;
  Timer? timer;

  CountdownController({required Duration duration, VoidCallback? onEnd}) 
      : _countDownDuration = duration,
        _onEnd = onEnd,
        super(Duration.zero);

  void start()  {
    if(!_started) {
      _endTime = DateTime.now().add(_countDownDuration);
      value = _endTime!.difference(DateTime.now());
      final id =  DateTime.now().hashCode;
      timer = Timer.periodic(Duration(seconds: 1), (timer) {

        print('Timer id: $id');
        final restTime = _endTime!.difference(DateTime.now());

        if(restTime > Duration.zero){
          value = restTime;
        } else {
          if(_onEnd != null) _onEnd();
          timer.cancel();
        }
      });
      _started = true;
    }
  }

  void restart() {
    timer?.cancel();
    _started = false;
    start();
  }

  @override
  void dispose() {
    timer?.cancel();
    _started = false;
    super.dispose();
  }

}