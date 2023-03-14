import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/fetch_restaurant_data.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class RestaurantState extends GetxController {
  var isLoading = true.obs;
  List<Restaurant> listRestaurant = [];

  @override
  void onInit() {
    getRestaurant();
    super.onInit();
  }

  void getRestaurant() async {
    try {
      isLoading(true);
      var results = await FetchRestaurantData.getRestaurant();
      var list = results.map((data) => Restaurant.fromJson(data)).toList();
      listRestaurant = list.cast<Restaurant>();
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    } finally {
      isLoading(false);
    }
  }
}
