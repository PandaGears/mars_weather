import 'package:flutter/material.dart';
import 'package:mars_weather/data/forecast_model.dart';

class ForecastWidget extends StatelessWidget {
  final List<ForecastModel> forecastList;

  const ForecastWidget({required this.forecastList, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('5-Day Forecast', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: forecastList.length,
            itemBuilder: (context, index) {
              final forcast = forecastList[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text('${forcast.date.day}/${forcast.date.month}'),
                      Image.network(
                        'https://openweathermap.org/img/wn/${forcast.icon}@2x.png',
                        width: 50,
                      ),
                      Text('${forcast.temperature}°C'),
                      Text(forcast.description),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
