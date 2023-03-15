import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/state/home_state.dart';

import '../data/model/restaurant.dart';
import '../widget/item_restaurant.dart';
import '../widget/search_restaurant.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeState _homeState = Get.put(HomeState());

  @override
  Widget build(BuildContext context) {
    _homeState.getRestaurant();
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
            const SizedBox(
              height: 8,
            ),
            SearchRestaurant(_homeState),
            Obx(
              () => (_homeState.isLoading.value)
                  ? const Center(child: CircularProgressIndicator())
                  : (_homeState.errorMessage.isNotEmpty)
                      ? Center(
                          child: Text(
                            _homeState.errorMessage.value,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      : buildListGrid(
                          _homeState.listRestaurant.value as List<Restaurant>),
            )
          ],
        ),
      ),
    );
  }
}

Expanded buildListGrid(List<Restaurant> listRestaurant) {
  return Expanded(
    child: (listRestaurant.isEmpty)
        ? const Center(
            child: Text(
              "Restaurant is not found",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        : GridView.builder(
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
