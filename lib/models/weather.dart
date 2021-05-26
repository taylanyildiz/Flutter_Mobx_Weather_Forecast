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
