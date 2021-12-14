import 'package:dharvya_assignment/constants.dart';
import 'package:dharvya_assignment/models/products.dart';
import 'package:dharvya_assignment/screens/product_details/details_screen.dart';
import 'package:flutter/material.dart';

import 'item_card.dart';

class StoreProductsBody extends StatelessWidget {
  const StoreProductsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: GridView.builder(
            itemCount: products.length,
            padding: const EdgeInsets.all(kDefaultPaddin),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: kDefaultPaddin,
              crossAxisSpacing: kDefaultPaddin,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => ItemCard(
              product: products[index],
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      product: products[index],
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}


// class SliverStoreProductsBody extends StatelessWidget {
//   const SliverStoreProductsBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SliverPadding(
//       padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
//       sliver: SliverGrid(
//         delegate: SliverChildBuilderDelegate(
//           (BuildContext context, int index) {
//             return ItemCard(
//               product: products[index],
//               press: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => DetailsScreen(
//                       product: products[index],
//                     ),
//                   )),
//             );
//           },
//           childCount: products.length,
//         ),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: kDefaultPaddin,
//           crossAxisSpacing: kDefaultPaddin,
//           childAspectRatio: 0.75,
//         ),
//       ),
//     );
//   }
// }