import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:weather_application/pages/home_page.dart';
import 'package:weather_application/utiles/binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeScreen(),
          binding: HomeBinding(),
        )
      ],
    );
  }
}

//*************************API KEY********************************* */

// api key = 171b94494ce84022c2ff94573d5e6959

//دة اللينك اللي بيجيب درجة الحرارة في بني سويف 

//   https://api.openweathermap.org/data/2.5/weather?q=beni%20suef&units=metric&appid=171b94494ce84022c2ff94573d5e6959


//دة اللي هيجيب الطقس في ال 5 ايام اللي جاية في بني سويف

//  https://api.openweathermap.org/data/2.5/forecast?q=beni%20suef&units=metric&appid=171b94494ce84022c2ff94573d5e6959









