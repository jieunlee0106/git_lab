import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nnz/src/controller/sharing_register_controller.dart';

class ConcertCategory extends StatelessWidget {
  ConcertCategory({super.key});
  final logger = Logger();
  final controller = Get.put(SharingRegisterController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        TextField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
          ),
          controller: controller.concertController,
          onChanged: (value) {
            logger.i(controller.sportsController.text);
            controller.testText(value);
          },
        ),
      ],
    );
  }
}
