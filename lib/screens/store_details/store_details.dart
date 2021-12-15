import 'package:dharvya_assignment/screens/store_details/widgets/gallery_body.dart';
import 'package:dharvya_assignment/screens/store_details/review_page/review_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dharvya_assignment/models/store.dart';

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
            BuildStoreAppBar(store: widget.store),
            SliverStoreCategories(tabController: _tabController!),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            const StoreProductsBody(),
            const StoreGalleryBody(),
            StoreReviewBody(store: widget.store),
            StoreInfoBody(store: widget.store),
          ],
        ),
      ),
    );
  }
}

class BuildStoreAppBar extends StatelessWidget {
  const BuildStoreAppBar({Key? key, required this.store}) : super(key: key);

  final Store store;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      padding: EdgeInsetsDirectional.zero,
      leading: CupertinoNavigationBarBackButton(
        color: Colors.black,
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      border: Border.all(color: Theme.of(context).scaffoldBackgroundColor),
      largeTitle: Text("${store.title}"),
    );
  }
}
