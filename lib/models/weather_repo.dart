import 'dart:math';

import 'package:flutter_weather_mobx/models/weather.dart';

mixin WeatherRepo {
  Future<Weather> fetchWeather(String cityName);
}

class FakeWeatherRepo with WeatherRepo {
  @override
  Future<Weather> fetchWeather(String cityName) {
    late double catchTemp;
    return Future.delayed(Duration(seconds: 1), () {
      final random = Random();
      if (random.nextBool()) {
        throw NetworkError();
      }
      catchTemp = 20 + random.nextInt(15) + random.nextDouble();

      return Weather(
        cityName: cityName,
        temp: catchTemp,
      );
    });
  }
}

class NetworkError {
  NetworkError();
}
