import 'package:flutter/material.dart';
import 'package:mars_weather/data/forecast_model.dart';
import 'package:mars_weather/data/weather_model.dart';
import 'package:mars_weather/logic/services/weather_service.dart';
import 'package:mars_weather/presentation/screens/weather/widgets/current_weather.dart';
import 'package:mars_weather/presentation/screens/weather/widgets/forcast_widget.dart';
import 'package:mars_weather/presentation/screens/weather/widgets/gradient_background.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _controller = TextEditingController();
  final WeatherService _weatherService = WeatherService();

  WeatherModel? currentWeather;
  List<ForecastModel> forecast = [];
  bool isLoading = false;

  Future<void> searchCity() async {
    final city = _controller.text.trim();
    if (city.isEmpty) return;

    setState(() => isLoading = true);

    final weather = await _weatherService.fetchCurrentWeather(city);
    final forecastData = await _weatherService.fetchForecast(city);

    setState(() {
      currentWeather = weather;
      forecast = forecastData;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: currentWeather != null
                  ? WeatherGradient.getGradient(currentWeather!.description)
                  : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                  colors: [Colors.grey.shade200,
                    Colors.grey.shade400,
                  ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'enter city',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onSubmitted: (_) => searchCity(),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(onPressed: searchCity, child: Text('Get Weather')),
                  SizedBox(height: 20),
                  if (isLoading)
                    CircularProgressIndicator()
                  else if (currentWeather != null)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CurrentWeatherWidget(weather: currentWeather!),
                          SizedBox(height: 20),
                          ForecastWidget(forecastList: forecast),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
