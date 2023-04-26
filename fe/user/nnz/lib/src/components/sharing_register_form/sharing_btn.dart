import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/config.dart';

class SharingBtn extends StatelessWidget {
  const SharingBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Config.yellowColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: Center(
            child: Text(
              "등록하기",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
