import 'package:flutter/material.dart';

import '../data/model/restaurant.dart';
import '../pages/detail_page.dart';

class ItemRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  const ItemRestaurant(this.restaurant, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: const EdgeInsets.only(bottom: 2),
        width: double.infinity,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  restaurant,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  restaurant.pictureId,
                  height: 88,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8, top: 8),
                child: Text(
                  restaurant.name.toString(),
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8, top: 4),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star_rate,
                      color: Colors.amber,
                      size: 16.0,
                      semanticLabel: 'Rating Restaurant',
                    ),
                    Text(
                      " ${restaurant.rating}",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
