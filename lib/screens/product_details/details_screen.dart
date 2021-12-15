import 'package:dharvya_assignment/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: _buildAppBar(context),
      body: ProductDetailBody(product: product),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(CupertinoIcons.back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
