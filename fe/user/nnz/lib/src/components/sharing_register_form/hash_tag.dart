import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../config/config.dart';
import '../icon_data.dart';

class HashTag extends StatelessWidget {
  final logger = Logger();
  HashTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconData(
                  icon: ImagePath.hashTag,
                  size: 80,
                ),
                const SizedBox(
                  width: 12,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                ),
                const Text(
                  "태그",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width * 0.7,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "#해시태그 입력해주세요",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    logger.i("태그 추가해줘");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Config.yellowColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Text(
                        "추가하기",
                        style: TextStyle(color: Config.blackColor),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
