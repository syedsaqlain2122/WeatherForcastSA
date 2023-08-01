import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import '../../Weather_Model.dart';
import '../../constants/api_manager.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  ApiManager apiManager = ApiManager();
  dynamic response;

  userWeather() async {
    emit(WeatherLoading());
    try {
      Response response = await ApiManager.getRequest(
        "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m",
        
      );
        log(response.body);
      //if (response.statusCode == 200) {
        
        var decodedList =
            WeatherModel.fromJson(jsonDecode(response.body));

        emit(WeatherSuccess(weatherList:[decodedList]));
     // }
    } on SocketException {
      emit(WeatherInternetError());
    }  catch (e) {
      print(e);
      emit(WeatherFailed());
    }
  }
}