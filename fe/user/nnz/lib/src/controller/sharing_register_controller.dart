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
  late final sportsController;
  late final musicalController;
  late final concertController;
  late final esportsController;
  late final theaterController;
  late final movieController;
  late final conditionContrller;
  RxString performDate = "공연날짜 선택해주세요".obs;
  RxString openDate = "yyyy-mm-dd".obs;
  RxString openTime = "hh:mm".obs;
  List<ImageFile> imageList = [];
  RxString testText = "".obs;
  RxBool isAuthentication = false.obs;
  RxList<String> conList = RxList<String>();
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
    sportsController = TextEditingController();
    musicalController = TextEditingController();
    esportsController = TextEditingController();
    concertController = TextEditingController();
    theaterController = TextEditingController();
    movieController = TextEditingController();
    conditionContrller = TextEditingController();
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
  }

  void onChange(String text) {
    sharingController.text = text;
    logger.i(sharingController.text);
  }

  void addCondition(String condition) {
    conList.add(condition);
    logger.i(conList);
  }

  void removeCondition(String condition) {
    conList.remove(condition);
  }
}
