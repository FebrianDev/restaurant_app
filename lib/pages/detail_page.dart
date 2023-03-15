import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/data/model/customer_review.dart';
import 'package:restaurant_app/data/model/customer_review_post.dart';
import 'package:restaurant_app/state/detail_state.dart';
import 'package:restaurant_app/widget/item_drink.dart';
import 'package:restaurant_app/widget/item_food.dart';
import 'package:restaurant_app/widget/item_review.dart';

import '../data/model/Food.dart';
import '../data/model/drink.dart';
import '../data/model/menu.dart';

class DetailPage extends StatelessWidget {
  final String id;

  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _message = "";

  DetailPage(this.id, {Key? key}) : super(key: key);

  final DetailState _detailState = Get.put(DetailState());

  @override
  Widget build(BuildContext context) {
    _detailState.getDetailRestaurant(id);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Obx(
          () => _detailState.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : (_detailState.errorMessage.isNotEmpty)
                  ? Center(
                      child: Text(
                        _detailState.errorMessage.value,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Stack(
                        children: [
                          Image.network(
                            "https://restaurant-api.dicoding.dev/images/large/${_detailState.detailRestaurant.value.pictureId}",
                            width: double.infinity,
                            fit: BoxFit.fill,
                            height: 320,
                            errorBuilder: (ctx, error, _) => const Center(
                              child: Icon(
                                Icons.error,
                                size: 42,
                              ),
                            ),
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
                                    _detailState.detailRestaurant.value.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
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
                                        " ${_detailState.detailRestaurant.value.rating}",
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      )
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
                                        " ${_detailState.detailRestaurant.value.city}",
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    "Description",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    _detailState
                                        .detailRestaurant.value.description,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    "Menu",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    " Food",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 36,
                                    width: double.infinity,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Menu.fromJson(_detailState
                                              .detailRestaurant.value.menus)
                                          .foods
                                          .length,
                                      // This next line does the trick.
                                      itemBuilder: (context, index) => ItemFood(
                                          Food.fromJson(Menu.fromJson(
                                                  _detailState.detailRestaurant
                                                      .value.menus)
                                              .foods[index])),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    " Drink",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 36,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Menu.fromJson(_detailState
                                              .detailRestaurant.value.menus)
                                          .drinks
                                          .length,
                                      // This next line does the trick.
                                      itemBuilder: (context, index) =>
                                          ItemDrink(
                                        Drink.fromJson(Menu.fromJson(
                                                _detailState.detailRestaurant
                                                    .value.menus)
                                            .drinks[index]),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    "Customer Review",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 64,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _detailState.detailRestaurant
                                          .value.customerReviews
                                          .cast<Map<String, dynamic>>()
                                          .map(
                                              (e) => CustomerReview.fromJson(e))
                                          .toList()
                                          .length,
                                      itemBuilder: (context, index) =>
                                          ItemReview(
                                        _detailState.detailRestaurant.value
                                            .customerReviews
                                            .cast<Map<String, dynamic>>()
                                            .map((e) =>
                                                CustomerReview.fromJson(e))
                                            .toList()[index],
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.blue),
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Add Review'),
                                            content: SizedBox(
                                              height: 164,
                                              child: Form(
                                                key: _formKey,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextFormField(
                                                      validator: (value) {
                                                        if (value!.isEmpty ==
                                                            true) {
                                                          return 'Name must be filled';
                                                        }
                                                        return null;
                                                      },
                                                      onSaved: (value) {
                                                        _name = value!;
                                                      },
                                                      decoration:
                                                          const InputDecoration(
                                                        labelText: 'Name',
                                                        border:
                                                            OutlineInputBorder(),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    TextFormField(
                                                      validator: (value) {
                                                        if (value!.isEmpty ==
                                                            true) {
                                                          return 'Review Message must be filled';
                                                        }
                                                        return null;
                                                      },
                                                      onSaved: (value) {
                                                        _message = value!;
                                                      },
                                                      decoration:
                                                          const InputDecoration(
                                                        labelText: 'Message',
                                                        border:
                                                            OutlineInputBorder(),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('OK'),
                                                onPressed: () {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    _formKey.currentState!
                                                        .save();
                                                    _detailState.addReview(
                                                      CustomerReviewPost(
                                                          _detailState
                                                              .detailRestaurant
                                                              .value
                                                              .id,
                                                          _name,
                                                          _message),
                                                    );

                                                    Fluttertoast.showToast(
                                                        msg:
                                                            "Success Add Review",
                                                        backgroundColor:
                                                            Colors.grey,
                                                        fontSize: 12,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        textColor:
                                                            Colors.black);

                                                    Navigator.of(context).pop();
                                                  }
                                                },
                                              ),
                                              TextButton(
                                                child: const Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: const Text('Add Review'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
