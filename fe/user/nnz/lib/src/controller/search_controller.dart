import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ShowSearchController extends GetxController {
  late TextEditingController searchController;
  final logger = Logger();
  String? category;
  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
  }

  void onChangeCategory({required String value}) {
    category = value;
    logger.i(category);
  }
}
