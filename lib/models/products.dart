import 'package:flutter/material.dart';

///
/// To store ratings use the following format in firestore
/// pid/ratings.json
/// when fetching get the document with name that matches the pid.
///

class Product {
  final String? image, title, description;
  final int? price, size, pid;
  final Color? color;
  Product({
    this.pid,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
    pid: 1,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_1.png",
    color: const Color(0xFF3D82AE),
  ),
  Product(
    pid: 2,
    title: "Belt Bag",
    price: 234,
    size: 8,
    description: dummyText,
    image: "assets/images/bag_2.png",
    color: const Color(0xFFD3A984),
  ),
  Product(
    pid: 3,
    title: "Hang Top",
    price: 234,
    size: 10,
    description: dummyText,
    image: "assets/images/bag_3.png",
    color: const Color(0xFF989493),
  ),
  Product(
    pid: 4,
    title: "Old Fashion",
    price: 234,
    size: 11,
    description: dummyText,
    image: "assets/images/bag_4.png",
    color: const Color(0xFFE6B398),
  ),
  Product(
    pid: 5,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_5.png",
    color: const Color(0xFFFB7883),
  ),
  Product(
    pid: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: const Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
