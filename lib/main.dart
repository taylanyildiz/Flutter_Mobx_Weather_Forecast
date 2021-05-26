import 'package:flutter/material.dart';
import 'package:flutter_weather_mobx/models/weather_repo.dart';
import 'package:flutter_weather_mobx/models/weather_store.dart';
import 'package:provider/provider.dart';
import 'screens/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => WeatherFetch(FakeWeatherRepo()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Weather Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(title: 'Flutter Weather'),
      ),
    );
  }
}
