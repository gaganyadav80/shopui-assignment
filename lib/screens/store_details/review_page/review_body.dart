import 'package:dharvya_assignment/constants.dart';
import 'package:dharvya_assignment/models/store.dart';
import 'package:dharvya_assignment/screens/store_details/review_page/reviews_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_review.dart';

class StoreReviewBody extends StatelessWidget {
  const StoreReviewBody({Key? key, required this.store}) : super(key: key);

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPaddin),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Rate this store",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const Text("Tell others what you think"),
            ReviewBodyRating(openPage: true, storeid: store.sid!),
            const SizedBox(height: kDefaultPaddin / 4),
            const SizedBox(height: kDefaultPaddin),
            const SizedBox(height: 10),
            StoreReviewList(storeid: store.sid!),
          ],
        ),
      ),
    );
  }
}
