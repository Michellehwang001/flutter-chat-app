import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// timestamp 값
String dateMillisecondsToString(int mills) {
  return DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(mills));
}

String timeNow() {
    String result;
    if (TimeOfDay.now().hour > 12) {
      result = (TimeOfDay.now().hour - 12).toString() +
          ':' +
          TimeOfDay.now().minute.toString() +
          'PM';
    } else {
      result = TimeOfDay.now().hour.toString() +
          ':' +
          TimeOfDay.now().minute.toString() +
          'AM';
    }
    return result;
  }
