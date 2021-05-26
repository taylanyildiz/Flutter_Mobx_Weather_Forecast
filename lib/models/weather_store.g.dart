// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherFetch on _WeatherStore, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state => (_$stateComputed ??=
          Computed<StoreState>(() => super.state, name: '_WeatherStore.state'))
      .value;

  final _$_weatherFutureAtom = Atom(name: '_WeatherStore._weatherFuture');

  @override
  ObservableFuture<Weather>? get _weatherFuture {
    _$_weatherFutureAtom.reportRead();
    return super._weatherFuture;
  }

  @override
  set _weatherFuture(ObservableFuture<Weather>? value) {
    _$_weatherFutureAtom.reportWrite(value, super._weatherFuture, () {
      super._weatherFuture = value;
    });
  }

  final _$weatherAtom = Atom(name: '_WeatherStore.weather');

  @override
  Weather? get weather {
    _$weatherAtom.reportRead();
    return super.weather;
  }

  @override
  set weather(Weather? value) {
    _$weatherAtom.reportWrite(value, super.weather, () {
      super.weather = value;
    });
  }

  final _$errorMsgAtom = Atom(name: '_WeatherStore.errorMsg');

  @override
  String? get errorMsg {
    _$errorMsgAtom.reportRead();
    return super.errorMsg;
  }

  @override
  set errorMsg(String? value) {
    _$errorMsgAtom.reportWrite(value, super.errorMsg, () {
      super.errorMsg = value;
    });
  }

  final _$getWeatherAsyncAction = AsyncAction('_WeatherStore.getWeather');

  @override
  Future<dynamic> getWeather(String cityName) {
    return _$getWeatherAsyncAction.run(() => super.getWeather(cityName));
  }

  @override
  String toString() {
    return '''
weather: ${weather},
errorMsg: ${errorMsg},
state: ${state}
    ''';
  }
}
