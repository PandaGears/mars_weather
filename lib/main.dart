import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mars_weather/presentation/screens/weather/weather_screen.dart';

void main() async {
  await dotenv.load(fileName: "keys/.env");
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: WeatherScreen(),
    );
  }
}