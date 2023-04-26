import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../config/config.dart';
import '../icon_data.dart';

class SharingChoice extends StatelessWidget {
  final logger = Logger();
  SharingChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconData(
                  icon: ImagePath.choice,
                  size: 80,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    "나눔 선택",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width * 0.7,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Config.blackColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Text("나눔을 선택해주세요"),
                ),
                GestureDetector(
                  onTap: () {
                    logger.i("공연 선택을 해주세요");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Config.yellowColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Text(
                        "조회",
                        style: TextStyle(
                          fontSize: 14,
                        ),
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
