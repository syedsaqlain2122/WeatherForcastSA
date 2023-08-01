import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_cubit/weather_cubit.dart';

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<WeatherCubit>(create: (context) => WeatherCubit()),
];
}