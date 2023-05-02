import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nnz/src/controller/sharing_register_controller.dart';

class MovieCategory extends StatelessWidget {
  MovieCategory({super.key});
  final controller = Get.put(SharingRegisterController());
  final logger = Logger();
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
          controller: controller.movieController,
          onChanged: (value) {
            logger.i(controller.sportsController.text);
            controller.testText(value);
          },
        ),
      ],
    );
  }
}
