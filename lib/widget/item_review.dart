import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/customer_review.dart';

class ItemReview extends StatelessWidget {
  final CustomerReview customerReview;

  const ItemReview(this.customerReview);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 8, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SizedBox(
          height: 8,
        ),
        Text(
          customerReview.name,
          style:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          customerReview.date,
          style:
          const TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
        ),
            const SizedBox(
              height: 4,
            ),
        Text(
          customerReview.review,
          style: const TextStyle(fontSize: 12),
        ),])

    );
  }
}
