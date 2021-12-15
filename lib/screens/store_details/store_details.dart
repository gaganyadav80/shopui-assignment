import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dharvya_assignment/constants.dart';
import 'package:dharvya_assignment/screens/store_details/widgets/gallery_body.dart';
import 'package:dharvya_assignment/screens/store_details/widgets/review_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dharvya_assignment/models/store.dart';
import 'package:uuid/uuid.dart';

import 'widgets/categories.dart';
import 'widgets/info_body.dart';
import 'widgets/products_body.dart';

class StoreDetailScreen extends StatefulWidget {
  const StoreDetailScreen({Key? key, required this.store}) : super(key: key);

  final Store store;

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool value) {
          return [
            BuildStoreAppBar(
              store: widget.store,
              tabController: _tabController!,
              reviewController: _reviewController,
            ),
            SliverStoreCategories(tabController: _tabController!),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            const StoreProductsBody(),
            const StoreGalleryBody(),
            StoreReviewBody(
              store: widget.store,
              reviewController: _reviewController,
            ),
            StoreInfoBody(store: widget.store),
          ],
        ),
      ),
    );
  }
}

class BuildStoreAppBar extends StatefulWidget {
  const BuildStoreAppBar({
    Key? key,
    required this.store,
    required this.tabController,
    this.reviewController,
  }) : super(key: key);

  final Store store;
  final TabController tabController;
  final TextEditingController? reviewController;

  @override
  State<BuildStoreAppBar> createState() => _BuildStoreAppBarState();
}

class _BuildStoreAppBarState extends State<BuildStoreAppBar> {
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() => _rebuild());
  }

  void _rebuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      padding: EdgeInsetsDirectional.zero,
      leading: IconButton(
        splashRadius: 30.w,
        icon: const Icon(CupertinoIcons.back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      trailing: widget.tabController.index == 2
          ? Padding(
              padding: const EdgeInsets.only(right: kDefaultPaddin / 2),
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
            )
          : const SizedBox.shrink(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      border: Border.all(color: Theme.of(context).scaffoldBackgroundColor),
      largeTitle: Text("${widget.store.title}"),
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
          FirebaseFirestore.instance.collection(widget.store.sid!);
      docRef.add({
        'uid': const Uuid().v1().toString(),
        'name': '${genRandomName(5)} ${genRandomName(5)}',
        'rating': ratingCnst.value,
        'date': Timestamp.now(),
        'review': widget.reviewController?.text.toString(),
      });
    } catch (e) {
      debugPrint(e.toString());
    }

    widget.reviewController?.clear();
    ratingCnst.value = -1;
  }
}
