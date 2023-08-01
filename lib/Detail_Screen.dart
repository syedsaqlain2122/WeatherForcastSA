import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Home_Screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/weather_cubit/weather_cubit.dart';

class DetailScreen extends StatefulWidget {
  String image, title, city, temperature;

  DetailScreen(
      {required this.image,
      required this.title,
      required this.city,
      required this.temperature,
      });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

    List<Map<String, dynamic>> dayList = [
    {
      "day": "Mon",
      "time": "6pm"
    },
    {
      "day": "Tue",
      "time": "7pm"
    },
    {
      "day": "Wed",
      "time": "8pm"
    },
    {
      "day": "Thu",
      "time": "9pm"
    },
    {
      "day": "Fri",
      "time": "10pm"
    },
    {
      "day": "Sat",
      "time": "11pm"
    },
    {
      "day": "Sun",
      "time": "12pm"
    },
      {
      "day": "Mon",
      "time": "6pm"
    },
    {
      "day": "Tue",
      "time": "7pm"
    },
    {
      "day": "Wed",
      "time": "8pm"
    },
    {
      "day": "Thu",
      "time": "9pm"
    },
    {
      "day": "Fri",
      "time": "10pm"
    },
    {
      "day": "Sat",
      "time": "11pm"
    },
    {
      "day": "Sun",
      "time": "12pm"
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
                    padding: EdgeInsets.fromLTRB(10.w, 10.h, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Icon(
                            Icons.menu_outlined,
                            size: 32.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(
                    height: 30.h,
                  ),
                  Center(child: Text("Weather",style:TextStyle(
                   color: Colors.white,
                   fontSize: 40.sp,
                   fontWeight: FontWeight.bold)
                 )),
                  SizedBox(height: 25.h),
                 Padding(
                   padding: EdgeInsets.fromLTRB(9.0.w,9.0.h,9.0.w,9.0.h),
                   child: Container(
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10.r),
                                color: const Color.fromARGB(255, 30, 30, 30),
                              ),               
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: EdgeInsets.all(8.0.h),
                           child: Row(
                             children:  [
                               const Icon(Icons.location_on, color: Colors.white,),
                               Text(" Jamil Chowk",style:TextStyle(
                               color: Colors.white,
                               fontSize: 17.sp,
                               //fontWeight: FontWeight.bold
                               )),
                             ],
                           ),
                         ),
                          Padding(
                           padding:  EdgeInsets.fromLTRB(15.w,0.0,0,0),
                           child:  Text(state.weatherList.first.currentWeather.time.toString(), style: const TextStyle(
                              color: Color.fromARGB(255, 130, 130, 130),
                              fontWeight: FontWeight.bold
                           ),),
                         ),
      
                         Padding(
                           padding: EdgeInsets.only(left: 9.w, top: 9.h),
                           child: Row(
                             children: [
                                Icon(Icons.sunny, color: Colors.yellow,size: 55.sp,),
                                Padding(
                                 padding: EdgeInsets.only(left:5.w),
                                 child: Text(state.weatherList.first.currentWeather.temperature.toString() + "\u00b0", 
                                 style: TextStyle(
                                   fontSize: 50.sp,
                                   color: Colors.white,
                                 ),
                                ),     
                               ),
                               Padding(
                                 padding: EdgeInsets.only(left: 70.w),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.end,
                                   children: [
                                      Text(state.weatherList.first.currentWeather.winddirection.toString(), style:  const TextStyle(
                                      color: Color.fromARGB(255, 130, 130, 130),                                 
                                    ),),
                                    SizedBox(height:2.h),
                                      Text(state.weatherList.first.currentWeather.windspeed.toString() + " km/h", style: const TextStyle(
                                      color: Color.fromARGB(255, 130, 130, 130),                                
                                  ),),
                                    SizedBox(height:2.h),
                                     const Text("Feels like 28\u00b0", style: TextStyle(
                                      color: Color.fromARGB(255, 130, 130, 130),                                
                                  ),),
                                    SizedBox(height:2.h),
      
                                   ],
                                 ),
                               )
                             ],
                           ),
                         ),

                         SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(
                                    height: 90.0.h,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(10.w,0.0,6.0.w,5.0.h),
                                      child: ListView.builder(
                                        physics: const ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: dayList.length,
                                        itemBuilder: (context, i) => SizedBox(
                                          height: 5.h,
                                          width: 54.h,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                               Text(dayList[i]["time"],style: const TextStyle(
                                                color: Color.fromARGB(255, 130, 130, 130), 
                                                 fontWeight: FontWeight.bold,                               
                                                  ),),
                                                  const Icon(Icons.sunny, color: Colors.yellow,),
                                                  Text(state.weatherList.first.currentWeather.temperature.toString() + "\u00b0",style: const TextStyle(
                                                  color: Color.fromARGB(255, 130, 130, 130),                                
                                            )),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                ),                        
                              ],
                            )
                          ),    
                     ],
                   )
                 ),
                 ),
                  SizedBox(height: 4.h),
                  Padding(
                   padding: EdgeInsets.fromLTRB(9.0.w,9.0.h,9.0.w,2.0.h),
                   child: Container(
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10.r),
                                color: const Color.fromARGB(255, 30, 30, 30)),               
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: EdgeInsets.fromLTRB(9.0.w,9.0.h,9.0.w,1.0.h),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(" Yasterday",style:TextStyle(
                               color: Colors.white,
                               fontSize: 17.sp,
                               )),
                                const Text("36\u00b0/28\u00b0",style: TextStyle(
                                 color: Color.fromARGB(255, 130, 130, 130),                                
                              )
                            ),                       
                           ],
                         ),
                       ),
                       SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(
                                    height: 250.0.h,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(16.w,0.0,9.0.w,5.0.h),
                                      child: ListView.builder(
                                        physics: const ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: dayList.length,
                                        itemBuilder: (context, i) => Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:  [
                                             Text(dayList[i]["day"],style: const TextStyle(
                                           color: Color.fromARGB(255, 130, 130, 130), 
                                           fontWeight: FontWeight.bold,                               
                                             ),),
                                             Padding(
                                               padding: EdgeInsets.all(8.0.h),
                                               child: SizedBox(
                                                 width: 60.w,
                                                 child: Row(
                                                   children:  [
                                                    const Icon(Icons.water_drop_outlined, size: 18, color: Color.fromARGB(255, 175, 213, 245),),
                                                     Text(state.weatherList.first.currentWeather.windspeed.toString(), style: const TextStyle(
                                                    color: Color.fromARGB(255, 130, 130, 130),)),
                                                  ],
                                                 ),
                                               ),
                                             ),   
                                            Row(
                                              children: [
                                                const Icon(Icons.sunny, color: Colors.yellow,),
                                                SizedBox(width: 2.w),
                                                const Icon(Icons.cloud, color: Colors.yellow,),
                                              ],
                                                ),                                  
                                                 Text(state.weatherList.first.currentWeather.temperature.toString() + "\u00b0",style: const TextStyle(
                                              color: Color.fromARGB(255, 130, 130, 130),                                
                                          ),),                       
                                        ],
                                      ),
                                    ),
                                  ),
                                ),                        
                              ],
                            )
                          ),
                        ]
                      ),
                    )
                  ),
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
