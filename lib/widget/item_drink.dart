import 'package:flutter/material.dart';

import '../data/model/drink.dart';

class ItemDrink extends StatelessWidget {
  final Drink drink;

  ItemDrink(this.drink);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(4),
        height: 36,
        decoration: const BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Text(
          drink.name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
