import 'package:flutter_weather_mobx/models/weather.dart';
import 'package:flutter_weather_mobx/models/weather_repo.dart';
import 'package:mobx/mobx.dart';

part 'weather_store.g.dart';

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
