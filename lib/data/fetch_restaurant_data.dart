import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:restaurant_app/data/model/restaurant_response.dart';

class FetchRestaurantData {
  static Future<List<dynamic>> getRestaurant() async {
    final String response =
    await rootBundle.loadString('assets/local_restaurant.json');
    final data = await json.decode(response.toString());
   return RestaurantResponse.fromJson(data).restaurants;
  }
}
