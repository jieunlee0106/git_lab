import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/message_popup.dart';

enum PageName { HOME, SERACH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  RxInt navIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    print(page);
    switch (page) {
      case PageName.UPLOAD:
        Get.toNamed("/sharingRegister");
        break;
      case PageName.HOME:
      case PageName.SERACH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        changeIndex(value);
        break;
    }
  }

  void changeIndex(int value, {bool hasGesture = true}) {
    print(value);
    navIndex(value);
    if (bottomHistory.last != value) {
      bottomHistory.add(value);
    }
    print(bottomHistory);
  }

  Future<bool> willPopAction() async {
    //bottomHisttory가 하나 요소가 남았을 떄 시스템 종료 할 수 있게끔....
    if (bottomHistory.length == 1) {
      showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
            title: "시스템 종료",
            message: "정말 종료하시겠습니까?",
            okCallBack: () {
              exit(0);
            },
            cancelCallback: () {
              Get.back();
            }),
      );
      return true;
    }
    //아직 요소들이 남아있다면 마지막 요소를 제거하고 체인지 index까지 해주면 된다.
    else {
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeIndex(index, hasGesture: false);
      return false;
    }
  }
}
