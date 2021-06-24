import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// timestamp 값
String dateMillisecondsToString(int mills) {
  return DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(mills));
}

// 확장 함수 (확장 메소드)
extension MyInt on int {
  String toDateString() {
    return DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(this));
  }
}
