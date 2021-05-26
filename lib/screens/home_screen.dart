import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_weather_mobx/models/weather.dart';
import 'package:flutter_weather_mobx/models/weather_store.dart';
import 'package:flutter_weather_mobx/widgets/city_input.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherFetch? _weatherFetch;
  List<ReactionDisposer?>? disposers;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('initial');
    _weatherFetch ??= Provider.of<WeatherFetch>(context);
    disposers ??= [
      reaction((_) => _weatherFetch!.errorMsg, (String? message) {
        _scaffoldKey.currentState!
            // ignore: deprecated_member_use
            .showSnackBar(SnackBar(content: Text(message!)));
      }),
    ];
  }

  @override
  void dispose() {
    disposers!.forEach((d) => d!());
    super.dispose();
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInput(),
    );
  }

  Widget columnWithData(Weather? weather) {
    if (weather == null) return buildInitialInput();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weather.cityName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('${weather.temp.toStringAsFixed(1)}'),
        CityInput(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title!),
        centerTitle: true,
      ),
      body: Center(
        child: Observer(
          builder: (_) {
            switch (_weatherFetch!.state) {
              case StoreState.initial:
                return buildInitialInput();
              case StoreState.loading:
                return buildLoading();
              case StoreState.loaded:
                return columnWithData(_weatherFetch?.weather);
            }
          },
        ),
      ),
    );
  }
}
