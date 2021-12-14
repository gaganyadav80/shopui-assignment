import 'package:dharvya_assignment/constants.dart';
import 'package:dharvya_assignment/models/store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'store_details/store_details.dart';

class StoresListScreen extends StatelessWidget {
  const StoresListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Vx.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        title: "HOME".text.bold.xl5.color(kTextColor).make(),
        centerTitle: false,
        titleTextStyle: GoogleFonts.limelight(),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.w),
        child: ListView.builder(
            itemCount: stores.length,
            itemBuilder: (BuildContext context, int i) {
              return BuildStoreListCard(store: stores[i]);
            }),
      ),
    );
  }
}

class BuildStoreListCard extends StatelessWidget {
  const BuildStoreListCard({Key? key, this.store}) : super(key: key);

  final Store? store;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 5.w),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StoreDetailScreen(store: store),
            )),
        child: Card(
          elevation: 2.w,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.w)),
          child: SizedBox(
            height: (768 / 4.5).w,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(16.w)),
                  child: Image.network(
                    'https://images.pexels.com/photos/776938/pexels-photo-776938.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
                    height: (768 / 4.5).w,
                    width: (1366 / 10).w,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BuildStoreListCardDetails(store: store),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildStoreListCardDetails extends StatelessWidget {
  const BuildStoreListCardDetails({Key? key, this.store}) : super(key: key);

  final Store? store;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${store?.title}",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.w),
            SizedBox(
              width: 230.w,
              child: Text(
                "${store?.description}",
              ),
            ),
          ],
        ),
        "${store?.location}".text.bold.make(),
      ],
    );
  }
}
