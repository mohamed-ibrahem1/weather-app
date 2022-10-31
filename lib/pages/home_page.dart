import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_application/widgets/main_weather_card.dart';
import '../controller/home_controller.dart';
import '../widgets/chart_card.dart';
import '../widgets/horizontal_city_list.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //السطر اللي تحت دة هو تقريبا اللي مش مخلي الاسكرين متعملش
      //----- scroll ------
      resizeToAvoidBottomInset: false,
      body: GetBuilder<HomeController>(
        builder: (controller) => Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cloud-in-blue-sky.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Stack(
                  children: [
                    const SearchBar(),
                    Align(
                      alignment: const Alignment(0.0, 1.0),
                      child: SizedBox(
                        height: 10,
                        width: 10,
                        child: OverflowBox(
                          minWidth: 0.0,
                          maxWidth: MediaQuery.of(context).size.width,
                          minHeight: 0.0,
                          maxHeight: (MediaQuery.of(context).size.height / 3.5),
                          child: Stack(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                width: double.infinity,
                                height: double.infinity,
                                child: const MainWeatherCard(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      padding: const EdgeInsets.only(top: 120),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'other city'.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                      fontSize: 16,
                                      fontFamily: 'flutterfonts',
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            const HorizontalCityList(),
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'forcast next 5 days'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        ?.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            const ChartCard(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
