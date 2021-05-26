# flutter_weather_mobx

This project simulate Weather Forecast with Provider and Mobx

|              App Display             | 
| :----------------------------------: | 
| <a  target="_blank"><img src="https://user-images.githubusercontent.com/37551474/119676352-77184700-be46-11eb-9310-a5c3ef8c2c3c.gif" width="220"></a> | 
## Getting Started

```dart
class WeatherFetch = _WeatherStore with _$WeatherFetch;

enum StoreState {
  initial,
  loading,
  loaded,
}

abstract class _WeatherStore with Store {
  late WeatherRepo _weatherRepo;
  _WeatherStore(this._weatherRepo);

  @observable
  ObservableFuture<Weather>? _weatherFuture;
  @observable
  Weather? weather;
  @observable
  String? errorMsg;

  @computed
  StoreState get state {
    if (_weatherFuture == null ||
        _weatherFuture!.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _weatherFuture!.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future getWeather(String cityName) async {
    try {
      errorMsg = null;
      _weatherFuture = ObservableFuture(_weatherRepo.fetchWeather(cityName));
      weather = await _weatherFuture;
    } on NetworkError {
      errorMsg = "Couldn't fetch weather.Is the device online?";
    }
  }
}
```


```dart
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
```

```dart
class Weather {
  const Weather({
    required this.cityName,
    required this.temp,
  });

  final String cityName;
  final double temp;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Weather) && other.cityName == cityName && other.temp == temp;

  @override
  int get hashCode => cityName.hashCode ^ temp.hashCode;
}
```

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
