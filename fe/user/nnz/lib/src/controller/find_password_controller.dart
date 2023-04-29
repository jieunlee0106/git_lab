import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class FindPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final logger = Logger();
  late final phoneController;
  late final authNumberController;
  late final passwordController;
  late final passwordConfirmController;
  late Timer timer;
  RxBool numberChecked = false.obs;
  RxBool phoneChekced = false.obs;
  RxBool isAuthChecked = false.obs;
  RxBool requestSms = false.obs;
  RxBool pwdChecked = false.obs;
  RxBool pwdConfirmChecked = false.obs;
  RxBool findPwdChecked = false.obs;
  final RxInt totalCount = 120.obs;
  final RxString timeCount = "".obs;
  int seconds = 120;
  bool isTimerChecked = false;
  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    authNumberController = TextEditingController();
    passwordConfirmController = TextEditingController();
    passwordController = TextEditingController();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {});
  }

  @override
  void onClose() {
    super.onClose();
    if (timer.isActive) {
      timer.cancel();
    }
  }

  void onSms() {
    requestSms(true);
    phoneChekced(false);
    startTimer();
  }

  bool onPasswordValidate({required String text}) {
    String pattern =
        r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(text)) {
      return false;
    }
    return true;
  }

  void onCheckAuthNumber() {
    isAuthChecked(true);
    if (timer.isActive) {
      timer.cancel();
    }
  }

  void startTimer() {
    if (timer.isActive) {
      timer.cancel();
      seconds = 120;
      totalCount(seconds);
      onTimer();
    } else {
      onTimer();
    }
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return '$duration'.substring(2, 7);
  }

  void onTest() {
    logger.i("들어왔냠? ${pwdChecked.value}");
    logger.i("들어왔냠 확인? ${pwdConfirmChecked.value}");
    findPwdChecked.value =
        pwdChecked.value && pwdConfirmChecked.value ? true : false;
    logger.i("너 뭔데 ${findPwdChecked.value}");
  }

  void onTimer() {
    isTimerChecked = false;
    if (authNumberController.text.length >= 6) {
      isAuthChecked(true);
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        timeCount(format(seconds));
        if (seconds < 110) {
          phoneChekced.value = true;
        }
      } else {
        seconds = 120;
        isTimerChecked = true;
        isAuthChecked(false);
        timer.cancel();
      }
    });
  }

  void onFindPassword() {
    logger.i("비밀번호 상태 ${pwdChecked.value}");
    logger.i("비밀번호확인 상태 ${pwdConfirmChecked.value}");
    logger.i("되냐? 상태 ${findPwdChecked.value}");
  }
}
