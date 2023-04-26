import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../icon_data.dart';

class PeopleCount extends StatelessWidget {
  const PeopleCount({super.key});

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
                  icon: ImagePath.peopleCount,
                  size: 80,
                ),
                const SizedBox(
                  width: 12,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                ),
                const Text(
                  "인원수",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 60,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Config.blackColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "+",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                const Text(
                  "0",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Config.blackColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "-",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
