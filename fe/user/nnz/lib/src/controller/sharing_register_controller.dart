import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:nnz/src/components/register_form/share_popup.dart';

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
  late final conditionController;
  late final hashTagController;
  late final performController;
  List<ImageFile> imageList = [];
  RxList<String> conList = RxList<String>();
  RxList<String> tagList = RxList<String>();
  RxString performDate = "공연날짜 선택해주세요".obs;
  RxString openDate = "yyyy-mm-dd".obs;
  RxString openTime = "hh:mm".obs;
  RxString testText = "".obs;

  RxBool isAuthentication = false.obs;

  RxInt peopleCount = 0.obs;
  final logger = Logger();
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
    conditionController = TextEditingController();
    hashTagController = TextEditingController();
    performController = TextEditingController();
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

  void onIncrease() {
    peopleCount(peopleCount.value + 1);
    logger.i(peopleCount.value);
  }

  void onDecrease() {
    peopleCount(peopleCount.value - 1);
    logger.i(peopleCount.value);
  }

  void onAddTag(String element) {
    tagList.add(element);
    logger.i(tagList);
  }

  void onRemoveTag(int index) {
    tagList.remove(tagList[index]);
  }

  void onShareRegister() {
    if (imageController.images.length == 0) {
      //popup창으로 바꿀 것
      showDialog(
          context: Get.context!,
          builder: (context) {
            return AlertDialog(
              content: const Text("이미지를 선택해주세요"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    FocusScope.of(context).unfocus();
                  },
                  child: const Text("확인"),
                ),
              ],
            );
          });
    } else if (sharingController.text.length <= 0) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return AlertDialog(
              content: const Text("공연을 선택해주세요"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    FocusScope.of(context).unfocus();
                  },
                  child: const Text("확인"),
                ),
              ],
            );
          });
    } else if (performController.text.length <= 0) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return const sharePopup(popupMessage: "공연시간을 선택해주세요");
          });
    } else if (titleController.text.length <= 0) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return const sharePopup(popupMessage: "제목을 입력해주세요");
          });
    } else if (isAuthentication.value == true) {
      if (conList.isEmpty) {
        showDialog(
            context: Get.context!,
            builder: (context) {
              return const sharePopup(popupMessage: "조건을 입력해주세요");
            });
      }
    } else if (peopleCount <= 0) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return const sharePopup(popupMessage: "인원수는 최소 1명 이상입니다.");
          });
    } else if (detailController.text.length <= 0) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return const sharePopup(popupMessage: "상세 정보를 입력해주세요");
          });
    } else {
      imageList.clear();
      for (var image in imageController.images) {
        imageList.add(image);
        logger.i("$image");
      }
    }
  }
}
