import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dharvya_assignment/constants.dart';
import 'package:dharvya_assignment/screens/store_details/review_page/firebase_storage_func.dart';
import 'package:dharvya_assignment/screens/store_details/review_page/review_upload.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ReviewBodyRatingBody extends StatefulWidget {
  const ReviewBodyRatingBody({Key? key, required this.storeid})
      : super(key: key);

  final String storeid;

  @override
  State<ReviewBodyRatingBody> createState() => _ReviewBodyRatingBodyState();
}

class _ReviewBodyRatingBodyState extends State<ReviewBodyRatingBody> {
  final TextEditingController _controller = TextEditingController();
  final String _uuid = const Uuid().v1().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: CupertinoNavigationBarBackButton(
          color: Colors.black,
          onPressed: () {
            ratingCnst.value = -1;
            Navigator.pop(context);
            deleteImages(widget.storeid, _uuid);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: TextButton(
              child: Text(
                "Post",
                style: TextStyle(
                  color: Colors.green[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.green[100]),
              onPressed: _onReviewPostPressed,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPaddin),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const ReviewBodyNameCard(),
              const SizedBox(height: 10.0),
              const ReviewBodyRating(openPage: false),
              const SizedBox(height: 20.0),
              ReviewBodyTextField(controller: _controller),
              const SizedBox(height: 10.0),
              ReviewUploadPictures(storeid: widget.storeid, userid: _uuid),
            ],
          ),
        ),
      ),
    );
  }

  String genRandomName(int n) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    return String.fromCharCodes(Iterable.generate(
        n, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  Future<void> _onReviewPostPressed() async {
    try {
      final result = await InternetAddress.lookup('firestore.googleapis.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw 'Cannot access "firestore.googleapis.com"!';
      }
      final CollectionReference docRef =
          FirebaseFirestore.instance.collection(widget.storeid);
      docRef.add({
        'uid': _uuid,
        'name': '${genRandomName(5)} ${genRandomName(5)}',
        'rating': ratingCnst.value,
        'date': Timestamp.now(),
        'review': _controller.text.toString(),
        'imageURL': <String>[],
      });
    } catch (e) {
      debugPrint(e.toString());
    }

    _controller.clear();
    ratingCnst.value = -1;
    Navigator.pop(context);
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
          radius: 35,
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
                    fontSize: 18.0,
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
  const ReviewBodyRating({Key? key, required this.openPage, this.storeid})
      : super(key: key);

  final bool openPage;
  final String? storeid;

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

                if (openPage) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ReviewBodyRatingBody(storeid: storeid!),
                    ),
                  );
                }
              },
            );
          }),
        ));
  }
}

class ReviewBodyTextField extends StatelessWidget {
  const ReviewBodyTextField({Key? key, required this.controller})
      : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      expands: true,
      maxLines: null,
      minLines: null,
      padding: const EdgeInsets.all(kDefaultPaddin),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(4.0),
      ),
      placeholder: 'Describe your experience (optional)',
    );
  }
}
