import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class RegisterController extends GetxController {
  late final GlobalKey formKey;
  final logger = Logger();
  final RxBool isAgree = false.obs;
  RxString timeCount = "".obs;
  int count = 10;
  final RxInt totalCount = 120.obs;
  late Timer timer;
  RxBool testBool = false.obs;
  RxBool nicknameChecked = false.obs;
  RxBool phoneChecked = false.obs;
  RxBool requestSms = false.obs;
  RxBool requestAgainSms = false.obs;
  RxBool isAuthChecked = false.obs;
  bool isTimerChecked = false;
  RxString test = "".obs;
  int seconds = 120; // seconds 변수 추가

  late final emailController;
  late final passwordController;
  late final passwordConfirmController;
  late final nicknameController;
  late final smsController;
  late final authNumberController;
  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
    nicknameController = TextEditingController();
    smsController = TextEditingController();
    authNumberController = TextEditingController();
    totalCount(count);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {});
  }

  @override
  void onClose() {
    super.onClose();
    if (timer.isActive) {
      timer.cancel();
    }
  }

  bool changeAgree(bool value) {
    print(value);
    return false;
  }

  void onChangeFiled(
      {required TextEditingController controller, required String text}) {
    controller.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(
        offset: text.length,
      ),
    );
    if (controller == emailController) {
      test(text);
    }
    logger.i(text);
  }

  void onSms() {
    requestSms(true);
    phoneChecked(false);
    requestAgainSms(false);
    logger.i(phoneChecked.value);
    startTimer();
  }

  bool onEmailValidate({required String text}) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(text)) {
      return false;
    }
    return true;
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

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return '$duration'.substring(2, 7);
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

  void onTest() {
    testBool(true);
    if (timer.isActive) {
      timer.cancel();
    }
  }

  void onTimer() {
    isTimerChecked = false;
    if (authNumberController.text.length >= 6) {
      isAuthChecked(true);
    }
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (seconds > 0) {
          seconds--;
          timeCount(
            format(seconds),
          );
          if (seconds < 110) {
            phoneChecked.value = true;
          }
        } else {
          seconds = 120;
          print("멈춰");
          isTimerChecked = true;
          isAuthChecked(false);
          timer.cancel();
        }
      },
    );
  }
}
