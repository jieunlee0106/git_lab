import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/config.dart';
import '../../controller/register_controller.dart';

class AuthBtn extends GetView<RegisterController> {
  const AuthBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Config.greyColor,
          ),
          child: const Center(
            child: Text(
              "회원가입",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
