import 'package:dharvya_assignment/constants.dart';
import 'package:dharvya_assignment/models/store.dart';
import 'package:dharvya_assignment/screens/store_details/widgets/reviews_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreReviewBody extends StatefulWidget {
  const StoreReviewBody({
    Key? key,
    required this.store,
    this.reviewController,
  }) : super(key: key);

  final Store store;
  final TextEditingController? reviewController;

  @override
  State<StoreReviewBody> createState() => _StoreReviewBodyState();
}

class _StoreReviewBodyState extends State<StoreReviewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPaddin),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ReviewBodyNameCard(),
            const ReviewBodyRating(),
            const SizedBox(height: kDefaultPaddin / 4),
            CupertinoTextField(
              controller: widget.reviewController,
              expands: true,
              maxLines: null,
              minLines: null,
              padding: const EdgeInsets.all(kDefaultPaddin / 2),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(4.0),
              ),
              placeholder: 'Describe your experience (optional)',
            ),
            const SizedBox(height: kDefaultPaddin),
            SizedBox(
              height: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Container(
                    height: 1.0,
                    color: Colors.black,
                  )),
                  const SizedBox(width: 5),
                  const Text("Store Reviews"),
                  const SizedBox(width: 5),
                  Expanded(
                      child: Container(
                    height: 1.0,
                    color: Colors.black,
                  )),
                ],
              ),
            ),
            const SizedBox(height: 10),
            StoreReviewList(storeid: widget.store.sid!),
          ],
        ),
      ),
    );
  }
}

class ReviewBodyNameCard extends StatelessWidget {
  const ReviewBodyNameCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.teal[800],
          backgroundImage: const NetworkImage(
            'https://images.pexels.com/photos/1987301/pexels-photo-1987301.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPaddin, vertical: kDefaultPaddin / 2.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Sarah John",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                    'Reviews are public and include your account and device info.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ReviewBodyRating extends StatelessWidget {
  const ReviewBodyRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (int index) {
            return IconButton(
              icon: ratingCnst.value >= index + 1
                  ? const Icon(CupertinoIcons.star_fill, color: Colors.black)
                  : const Icon(CupertinoIcons.star, color: Colors.black),
              iconSize: 34.0,
              padding: EdgeInsets.zero,
              onPressed: () {
                if (ratingCnst.value == 1 && index == 0) {
                  ratingCnst.value = -1;
                } else {
                  ratingCnst.value = index + 1;
                }
              },
            );
          }),
        ));
  }
}
