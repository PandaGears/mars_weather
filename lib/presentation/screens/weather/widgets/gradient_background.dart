import 'package:flutter/material.dart';

class WeatherGradient {
  static LinearGradient getGradient(String condition) {
    condition = condition.toLowerCase();

    Alignment begin = Alignment.topCenter;
    Alignment end = Alignment.bottomCenter;

    if (condition.contains('clear')) {
      return LinearGradient(
        begin: begin,
        end: end,
        colors: [Colors.yellow, Colors.blue.shade300, Colors.lightBlue.shade100],
      );
    } else if (condition.contains('cloud')) {
      return LinearGradient(
        begin: begin,
        end: end,
        colors: [Colors.blueGrey.shade400, Colors.grey.shade300],
      );
    } else if (condition.contains('rain') || condition.contains('drizzle')) {
      return LinearGradient(
        begin: begin,
        end: end,
        colors: [Colors.indigo.shade700, Colors.blueGrey.shade600],
      );
    } else if (condition.contains('thunderstorm')) {
      return LinearGradient(
        begin: begin,
        end: end,
        colors: [Colors.deepPurple.shade800, Colors.black87],
      );
    } else if (condition.contains('snow')) {
      return LinearGradient(
        begin: begin,
        end: end,
        colors: [Colors.white, Colors.blue.shade100],
      );
    } else if (condition.contains('mist') || condition.contains('fog')) {
      return LinearGradient(
        begin: begin,
        end: end,
        colors: [Colors.grey.shade200, Colors.grey.shade400],
      );
    } else {
      return LinearGradient(
        begin: begin,
        end: end,
        colors: [Colors.grey.shade300, Colors.grey.shade600],
      );
    }
  }
}
