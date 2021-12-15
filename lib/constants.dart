import 'package:dharvya_assignment/screens/store_details/review_page/firebase_storage_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const kTextColor = Color(0xFF262626);
const kTextLightColor = Color(0xFF535353);

const kDefaultPaddin = 20.0;
final RxInt ratingCnst = 0.obs;

// final String uuid = const Uuid().v1().toString();
late Future<List<ReviewImage>> futureFiles;
