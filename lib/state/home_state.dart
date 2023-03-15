import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../data/model/restaurant.dart';
import '../data/repository/restaurant_repository.dart';

class HomeState extends GetxController {
  var isLoading = true.obs;
  var listRestaurant = [].obs;
  var errorMessage = "".obs;
  final RestaurantRepository repository = RestaurantRepository();

  void getRestaurant() async {
    try {
      errorMessage("");
      isLoading(true);
      var results = await repository.getListRestaurant();
      var list = results.restaurants
          .cast<Map<String, dynamic>>()
          .map((data) => Restaurant.fromJson(data))
          .toList();
      listRestaurant.value = list;
    } catch (err) {
      errorMessage("Something went wrong internally");
      if (kDebugMode) {
        print(err);
      }
    } finally {
      isLoading(false);
    }
  }

  void getSearchRestaurant(String query) async {
    try {
      errorMessage("");
      isLoading(true);
      var results = await repository.getSearchRestaurant(query);
      var list = results.restaurants
          .cast<Map<String, dynamic>>()
          .map((data) => Restaurant.fromJson(data))
          .toList();
      listRestaurant.value = list.cast<Restaurant>();
    } catch (err) {
      errorMessage("Something went wrong internally");
      if (kDebugMode) {
        print(err);
      }
    } finally {
      isLoading(false);
    }
  }
}
