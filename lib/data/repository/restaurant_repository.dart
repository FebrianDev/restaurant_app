import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/customer_review_post.dart';
import 'package:restaurant_app/data/model/customer_review_response.dart';
import 'package:restaurant_app/data/model/detail_restaurant_response.dart';
import 'package:restaurant_app/data/model/restaurant_response.dart';

class RestaurantRepository {
  static const String baseUrl = "https://restaurant-api.dicoding.dev/";

  Future<RestaurantResponse> getListRestaurant() async {
    final response = await http.get(Uri.parse("$baseUrl/list"));
    return RestaurantResponse.fromJson(await jsonDecode(response.body));
  }

  Future<RestaurantResponse> getSearchRestaurant(String query) async {
    final response = await http.get(Uri.parse("$baseUrl/search?q=$query"));
    return RestaurantResponse.fromJson(await jsonDecode(response.body));
  }

  Future<DetailRestaurantResponse> getDetailRestaurant(String id) async {
    final response = await http.get(Uri.parse("$baseUrl/detail/$id"));
    return DetailRestaurantResponse.fromJson(jsonDecode(response.body));
  }

  Future<CustomerReviewResponse> addReview(
      CustomerReviewPost customerReview) async {
    try {
      final response = await http.post(Uri.parse("$baseUrl/review"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'id': customerReview.id,
            'name': customerReview.name,
            'review': customerReview.review
          }));

      if (response.statusCode == 201) {
        return CustomerReviewResponse.fromJson(jsonDecode(response.body));
      } else {
        return CustomerReviewResponse(true, "");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return CustomerReviewResponse(true, "");
    }
  }
}
