import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dharvya_assignment/models/store.dart';

import 'widgets/categories.dart';
import 'widgets/products_body.dart';

class StoreDetailScreen extends StatefulWidget {
  const StoreDetailScreen({Key? key, this.store}) : super(key: key);

  final Store? store;

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
            _buildStoreAppbar(),
            SliverStoreCategories(tabController: _tabController!),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            const StoreProductsBody(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }

  CupertinoSliverNavigationBar _buildStoreAppbar() {
    return CupertinoSliverNavigationBar(
      padding: EdgeInsetsDirectional.zero,
      leading: IconButton(
        splashRadius: 30.w,
        icon: const Icon(CupertinoIcons.back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      border: Border.all(color: Theme.of(context).scaffoldBackgroundColor),
      largeTitle: Text("${widget.store?.title}"),
    );
  }
}
