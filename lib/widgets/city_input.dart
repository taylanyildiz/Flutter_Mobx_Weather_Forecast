import 'package:flutter/material.dart';
import 'package:flutter_weather_mobx/models/weather_store.dart';
import 'package:provider/provider.dart';

class CityInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          onSubmitted: (input) => sumbitCityName(context, input),
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Search City',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            suffixIcon: Icon(Icons.search),
          ),
        ));
  }

  void sumbitCityName(BuildContext context, String cityName) async {
    final weather = Provider.of<WeatherFetch>(context, listen: false);
    await weather.getWeather(cityName);
  }
}
