part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
final List<WeatherModel> weatherList;

  const WeatherSuccess({required this.weatherList});

  List<Object> get props => [];
}

class WeatherFailed extends WeatherState {}

class WeatherInternetError extends WeatherState {}