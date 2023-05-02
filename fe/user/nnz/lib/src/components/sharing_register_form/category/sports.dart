import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nnz/src/controller/sharing_register_controller.dart';

class SportsCategory extends StatefulWidget {
  const SportsCategory({super.key});

  @override
  State<SportsCategory> createState() => _SportsCategoryState();
}

class _SportsCategoryState extends State<SportsCategory> {
  final List<String> _sportsItems = ['축구', '야구', '농구'];
  String? _selectedSports;
  final controller = Get.put(SharingRegisterController());
  final logger = Logger();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF3F3F3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: DropdownButton<String>(
                  underline: Container(),
                  isDense: true,
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  icon: Padding(
                    padding: EdgeInsets.only(
                      left: Get.width * 0.287,
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                    ),
                  ),
                  hint: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                    child: Text(
                      "스포츠 카테고리",
                    ),
                  ),
                  alignment: Alignment.center,
                  value: _selectedSports,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedSports = newValue;
                    });
                  },
                  items: _sportsItems.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 72,
                        ),
                        child: Text(item),
                      ),
                    );
                  }).toList(),
                ),
              ),
              _selectedSports != null
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        //검색을 하는 api가 있어야 됨
                        TextField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                          ),
                          controller: controller.sportsController,
                          onChanged: (value) {
                            logger.i(controller.sportsController.text);
                            controller.testText(value);
                          },
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
