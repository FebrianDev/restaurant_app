import 'package:flutter/material.dart';
import 'package:restaurant_app/state/home_state.dart';

class SearchRestaurant extends StatefulWidget {
  final HomeState _homeState;

  const SearchRestaurant(this._homeState);

  @override
  State<StatefulWidget> createState() => _SearchRestaurant(_homeState);
}

class _SearchRestaurant extends State<SearchRestaurant> {
  final HomeState _homeState;

  _SearchRestaurant(this._homeState);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, top: 8),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          labelText: 'Search Restaurants',
        ),
        onChanged: (value) {
          setState(() {
            if (value.isEmpty) {
              _homeState.getRestaurant();
            } else {
              _homeState.getSearchRestaurant(value);
            }
          });
        },
      ),
    );
  }
}
