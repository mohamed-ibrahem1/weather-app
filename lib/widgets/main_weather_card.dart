import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/controller/home_controller.dart';

class MainWeatherCard extends StatelessWidget {
  const MainWeatherCard({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      '${controller.currentWeatherData.name}'.toUpperCase(),
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            color: Colors.black45,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'flutterfonts',
                          ),
                    ),
                  ),
                  Center(
                    child: Text(
                      DateFormat().add_MMMMEEEEd().format(DateTime.now()),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black45,
                            fontSize: 16,
                            fontFamily: 'flutterfonts',
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: <Widget>[
                      Text(
                        (controller.currentWeatherData.weather != null)
                            ? '${controller.currentWeatherData.weather?[0].description}'
                            : '',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black45,
                              fontSize: 22,
                              fontFamily: 'flutterfonts',
                            ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        (controller.currentWeatherData.mainWeather != null)
                            ? '${(controller.currentWeatherData.mainWeather?.temp)}°C'
                            : '',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.black45, fontFamily: 'flutterfonts'),
                      ),
                      Text(
                        (controller.currentWeatherData.mainWeather != null)
                            ? 'min: ${(controller.currentWeatherData.mainWeather!.tempMin!).toString()} / max: ${(controller.currentWeatherData.mainWeather?.tempMax!).toString()}'
                            : '',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'flutterfonts',
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/3208/3208752.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        (controller.currentWeatherData.wind != null)
                            ? 'wind ${controller.currentWeatherData.wind?.speed} m/s'
                            : '',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'flutterfonts',
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
