import 'package:flutter/material.dart';

import '../data/model/Food.dart';

class ItemFood extends StatelessWidget {
  final Food food;

  ItemFood(this.food);

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
          food.name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
