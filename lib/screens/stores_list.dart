import 'package:dharvya_assignment/models/store.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'store_details.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.white,
        title: "Stores".text.bold.xl.make(),
      ),
      body: ListView.builder(
          itemCount: stores.length,
          itemBuilder: (BuildContext context, int i) {
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StoreDetailScreen())),
              child: const Card(),
            );
          }),
    );
  }
}
