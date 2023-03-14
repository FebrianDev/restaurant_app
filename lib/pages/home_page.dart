import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/state/restaurant_state.dart';

import '../data/model/restaurant.dart';
import '../widget/item_restaurant.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final RestaurantState _restaurantState = Get.put(RestaurantState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 16),
              child: const Text(
                "Restaurant App",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Obx(() => _restaurantState.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : buildListGrid(_restaurantState.listRestaurant))
          ],
        ),
      ),
    );
  }
}

Expanded buildListGrid(List<Restaurant> listRestaurant) {
  return Expanded(
    child: GridView.builder(
      primary: false,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: listRestaurant.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemRestaurant(listRestaurant[index]);
      },
    ),
  );
}
