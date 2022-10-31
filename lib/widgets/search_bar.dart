import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:weather_application/controller/home_controller.dart';

import '../constants/constanst.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: TextField(
          onChanged: (value) => controller.city = value,
          style: const TextStyle(
            color: Colors.white,
          ),
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            try {
              controller.updateWeather();
            } catch (e) {
              showSnackBar(context, 'there was an error');
            }
          },
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
    );
  }
}
