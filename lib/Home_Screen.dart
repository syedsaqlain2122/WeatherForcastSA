
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Detail_Screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/weather_cubit/weather_cubit.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  List<Map<String, dynamic>> gridlist = [
    {
      "image": "assets/weather1.jpg",
      "title": "My Location",
      "city": "Peshawar",
      "temperature": "43\u00b0",
    },
     {
      "image": "assets/weather2.jpg",
      "title": "My Location",
      "city": "Islamabad",
      "temperature": "33\u00b0",
    },
     {
      "image": "assets/weather3.jpg",
      "title": "My Location",
      "city": "Lahore",
      "temperature": "30\u00b0",
    },
     {
      "image": "assets/weather1.jpg",
      "title": "My Location",
      "city": "Rawalpindi",
      "temperature": "50\u00b0",
    },
     {
      "image": "assets/weather2.jpg",
      "title": "My Location",
      "city": "Multan",
      "temperature": "55\u00b0",
    },
    
  ];

  late WeatherCubit weatherCubit;
initCubits() async {
    weatherCubit = context.read<WeatherCubit>();
}

  @override
  void initState() {
  initCubits();
  weatherCubit.userWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<WeatherCubit, WeatherState>(
        
        builder: (context, state) {
          
          if(state is WeatherSuccess){

          
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.fromLTRB(25.w, 10.h, 0.w, 0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                         Text(
                          "Weather",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.sp,
                            fontFamily: 'RobotoBold',
                            fontWeight: FontWeight.bold,
                            wordSpacing: 1.sp,
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: 25.w),
                          child: Icon(   
                            Icons.menu_outlined,
                            color: Colors.white,
                            size: 32.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  SizedBox(
                    width: 320.w,
                    height: 45.h,
                    child: TextField(
                      style: TextStyle(
                        color: const Color.fromARGB(255, 144, 143, 143),
                        fontSize: 18.sp),
                      cursorColor: const Color.fromARGB(96, 60, 60, 60),
                      cursorHeight: 18.h,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 16, 16, 16),
                        filled: true,
                        suffixIcon: const Icon(
                          Icons.search_sharp,
                          color: Color.fromARGB(255, 189, 189, 189),
                        ),
                        hintText: 'Search for the city',
                        hintStyle:  TextStyle(
                          color: const Color.fromARGB(255, 118, 118, 118),
                          fontSize: 18.sp,
                          fontFamily: 'Roboto',
                          wordSpacing: 1.sp,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(color: Colors.transparent)),
                      ),
                    ),
                  ),              
                  SizedBox(height: 30.h),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(left: 18.w, right: 18.w),
                    shrinkWrap: true,
                    itemCount: gridlist.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2.9,
                    ),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(left: 4.w, right: 7.w),
                          child: Container(                       
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(gridlist[i]["image"]),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                              color: const Color.fromARGB(255, 209, 209, 209),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0.w, vertical: 0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(gridlist[i]["city"],
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold, 
                                      )),
                                      Text(state.weatherList.first.currentWeather.temperature.toString() + "\u00b0",
                                      style: TextStyle(
                                        fontSize: 50.sp,
                                        color: Colors.white,
                                      )),
                                    ], 
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      image: gridlist[i]["image"],
                                      title: gridlist[i]["title"],
                                      city: gridlist[i]["city"],
                                      temperature: gridlist[i]["temperature"],
                                   )
                                  ),
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                );
                }
                else {
                  return SizedBox(
                    child: Text(state.toString()),
                  );
                }
        }
      ),
          );
        }
      }