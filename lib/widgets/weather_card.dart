import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/controller/home_controller.dart';

class WeatherCard extends GetView<HomeController> {
  const WeatherCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
          image: NetworkImage(
            'https://cdn-icons-png.flaticon.com/512/1163/1163657.png',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Stack(
        children: [
          Container(
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 100,
              left: 20,
              right: 20,
            ),
            child: TextField(
              onChanged: (value) => controller.city = value,
              style: const TextStyle(
                color: Colors.white,
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) => controller.updateWeather(),
              decoration: InputDecoration(
                suffix: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintStyle: const TextStyle(color: Colors.white),
                hintText: 'Search'.toUpperCase(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, 1.0),
            child: SizedBox(
              height: 10,
              width: 10,
              child: OverflowBox(
                minWidth: 0.0,
                maxWidth: MediaQuery.of(context).size.width,
                minHeight: 0.0,
                maxHeight: (MediaQuery.of(context).size.height / 4),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: double.infinity,
                      width: double.infinity,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                top: 15,
                                left: 20,
                                right: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      '${controller.currentWeatherData.name}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Colors.black45,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      DateFormat()
                                          .add_MMMMEEEEd()
                                          .format(DateTime.now()),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Colors.black45,
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 50),
                                        child: Column(
                                          children: [
                                            Text(
                                              '${controller.currentWeatherData.weather![0].description}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 22,
                                                  ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              '${(controller.currentWeatherData.mainWeather!.temp!.toString())}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2!
                                                  .copyWith(
                                                    color: Colors.black45,
                                                  ),
                                            ),
                                            Text(
                                              'min: ${(controller.currentWeatherData.mainWeather!.tempMin!.toString())} / max: ${(controller.currentWeatherData.mainWeather!.tempMax!.toString())}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            const SizedBox(
                                              width: 120,
                                              height: 120,
                                            ),
                                            Container(
                                              child: Text(
                                                'wind ${controller.currentWeatherData.wind!.speed} m/s',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
