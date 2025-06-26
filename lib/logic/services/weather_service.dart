import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mars_weather/data/forecast_model.dart';
import 'package:mars_weather/data/weather_model.dart';

class WeatherService {
  final apiKey = dotenv.env['OPENWEATHER_API_KEY'];

  Future<WeatherModel?> fetchCurrentWeather(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return WeatherModel.fromJson(jsonData);
    } else {
      return null;
    }
  }

  Future<List<ForecastModel>> fetchForecast(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final List list = data['list'];

      return list
          .map((item) => ForecastModel.fromJson(item))
          .where((f) => f.date.hour == 12)
          .toList();
    } else {
      return [];
    }
  }
}
