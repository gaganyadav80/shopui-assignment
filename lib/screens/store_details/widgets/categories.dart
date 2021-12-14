import 'package:dharvya_assignment/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverStoreCategories extends StatelessWidget {
  const SliverStoreCategories({Key? key, required this.tabController})
      : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      pinned: true,
      toolbarHeight: 0.0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        centerTitle: false,
        title: TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: "Products"),
            Tab(text: "Gallery"),
            Tab(text: "Review"),
            Tab(text: "Info"),
          ],
          isScrollable: true,
          unselectedLabelColor: kTextLightColor,
          labelColor: Colors.black,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          indicatorColor: Colors.black,
          labelPadding: EdgeInsets.only(left: 0.0, right: 32.w),
          indicator: UnderlineTabIndicator(
            borderSide: const BorderSide(width: 2.0),
            insets: EdgeInsets.only(left: 0.0, right: 32.w),
          ),
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Products", "Gallery", "Reviews", "Info"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: kDefaultPaddin / 4),
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
