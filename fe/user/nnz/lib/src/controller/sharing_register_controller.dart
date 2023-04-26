import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

enum Condition { INIT, YES, NO }

class SharingRegisterController extends GetxController {
  late final imageController;
  late final titleController;
  late final detailController;
  RxBool isAuthentication = false.obs;
  @override
  void onInit() {
    super.onInit();
    imageController = MultiImagePickerController(
        maxImages: 5,
        withReadStream: true,
        allowedImageTypes: ['png', 'jpg', 'jpeg']);
    titleController = TextEditingController();
    detailController = TextEditingController();
  }
}
