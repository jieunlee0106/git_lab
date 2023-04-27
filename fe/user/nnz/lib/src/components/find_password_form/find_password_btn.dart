import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nnz/src/config/config.dart';

class FindPasswordBtn extends StatelessWidget {
  const FindPasswordBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Config.greyColor,
      ),
      child: const Center(child: Text("비밀번호 변경")),
    );
  }
}
