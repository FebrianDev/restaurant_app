import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../data/model/Food.dart';
import '../data/model/drink.dart';
import '../data/model/menu.dart';
import '../data/model/restaurant.dart';
import '../state/restaurant_state.dart';

class DetailPage extends StatelessWidget {
  final Restaurant restaurant;

   const DetailPage(this.restaurant, {super.key});

  @override
  Widget build(BuildContext context) {
    Menu menu = Menu.fromJson(restaurant.menus);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    restaurant.pictureId,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: 320,
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    iconSize: 24,
                    color: Colors.white,
                    padding: const EdgeInsets.only(left: 24, top: 24),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Card(
                    margin: const EdgeInsets.only(top: 300),
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                          bottomRight: Radius.zero,
                          bottomLeft: Radius.zero),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rate,
                                color: Colors.amber,
                                size: 16.0,
                                semanticLabel: 'Rating Restaurant',
                              ),
                              Text(
                                " ${restaurant.rating}",
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_city,
                                size: 16.0,
                                semanticLabel: 'Location Restaurant',
                              ),
                              Text(
                                " ${restaurant.city}",
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Description",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            restaurant.description,
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Menu",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            "Food",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: 96,
                            child: ListView.builder(
                              itemCount: menu.foods.length,
                              // This next line does the trick.
                              itemBuilder: (context, index) => Text(
                                "- ${Food.fromJson(menu.foods[index]).name}",
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            "Drink",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                          SizedBox(
                            height: 96,
                            child: ListView.builder(
                              itemCount: menu.drinks.length,
                              // This next line does the trick.
                              itemBuilder: (context, index) => Text(
                                "- ${Drink.fromJson(menu.drinks[index]).name}",
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
