import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/model/customer_review_post.dart';

import '../data/model/detail_restaurant.dart';
import '../data/repository/restaurant_repository.dart';

class DetailState extends GetxController {
  var isLoading = true.obs;
  var errorMessage = "".obs;
  var detailRestaurant =
      DetailRestaurant("", "", "", "", "", "", "", 0, []).obs;

  final RestaurantRepository repository = RestaurantRepository();

  void getDetailRestaurant(String id) async {
    try {
      errorMessage("");
      isLoading(true);
      var results = await repository.getDetailRestaurant(id);
      var detail = DetailRestaurant.fromJson(results.restaurant);
      detailRestaurant.value = detail;
    } catch (err) {
      errorMessage("Something went wrong internally");
      if (kDebugMode) {
        print(err);
      }
    } finally {
      isLoading(false);
    }
  }

  void addReview(CustomerReviewPost customerReview) async {
    try {
      errorMessage("");
      isLoading(true);
      var results = await repository.addReview(customerReview);
      Fluttertoast.showToast(
          msg: (!results.error) ? "Success Add Review" : "Failed Add Review",
          backgroundColor: Colors.grey,
          fontSize: 12,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.black);
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    } finally {
      isLoading(false);
    }
  }
}
