import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Home_Screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants/bloc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
           home:  HomeScreen(),
          );
        },
      ),
    );
  }
}

