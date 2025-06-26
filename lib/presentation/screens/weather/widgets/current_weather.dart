import 'package:flutter/material.dart';
import 'package:mars_weather/data/weather_model.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherModel weather;

  const CurrentWeatherWidget({required this.weather, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Current Weather', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Image.network(
          'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
          width: 100,
        ),
        Text('${weather.temperature}°C', style: TextStyle(fontSize: 24)),
        Text('Condition: ${weather.description}'),
        Text('Humidity: ${weather.humidity}%'),
        Text('Wind Speed: ${weather.windSpeed} m/s'),
      ],
    );
  }
}
