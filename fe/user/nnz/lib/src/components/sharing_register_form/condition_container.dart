import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/config.dart';
import '../icon_data.dart';

class ConditionContainer extends StatelessWidget {
  const ConditionContainer({super.key});

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
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconData(
                  icon: ImagePath.condition,
                  size: 80,
                ),
                const SizedBox(
                  width: 12,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text(
                    "조건",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
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
                      hintText: "조건을 입력해주세요",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("조건 추가해줘");
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
