import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

enum Condition { INIT, YES, NO }

class SharingRegisterController extends GetxController {
  late final imageController;
  late final titleController;
  late final detailController;
  late final sharingController;
  List<ImageFile> imageList = [];
  RxBool isAuthentication = false.obs;
  final logger = Logger();
  List<ImageFile> test = [];
  @override
  void onInit() {
    super.onInit();
    imageController = MultiImagePickerController(
        maxImages: 5,
        withReadStream: true,
        allowedImageTypes: ['png', 'jpg', 'jpeg']);
    titleController = TextEditingController();
    detailController = TextEditingController();
    sharingController = TextEditingController();
  }

  void onShareRegister() {
    if (imageController.images.length == 0) {
      //popup창으로 바꿀 것
      Get.snackbar("알림", "이미지를 선택해주세요");
    }

    imageList.clear();
    for (var image in imageController.images) {
      imageList.add(image);
      logger.i("$image");
    }
    // for (int i = 0; i < imageController.images.length; i++) {
    //   final image
    //   imageList.add(imag)
    // }
  }
}
