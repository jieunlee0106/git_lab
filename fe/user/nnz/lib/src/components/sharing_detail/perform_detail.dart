import 'package:flutter/material.dart';
import 'package:nnz/src/config/config.dart';

class PerformDetail extends StatelessWidget {
  const PerformDetail(
      {super.key, required this.performTitle, required this.iconName});

  final String performTitle;
  final IconData iconName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(
            iconName,
            color: const Color(0xFFF3C906),
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            performTitle,
            style: TextStyle(color: Config.blackColor),
          )
        ],
      ),
    );
  }
}
