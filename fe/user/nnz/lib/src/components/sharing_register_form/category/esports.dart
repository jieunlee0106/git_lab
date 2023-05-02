import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nnz/src/controller/sharing_register_controller.dart';

class EsportsCategory extends StatefulWidget {
  const EsportsCategory({super.key});

  @override
  State<EsportsCategory> createState() => _EsportsCategoryState();
}

class _EsportsCategoryState extends State<EsportsCategory> {
  final List<String> _esportsItems = ['LCK', '스타크래프트'];
  final controller = Get.put(SharingRegisterController());
  final logger = Logger();
  String? _selectedeSports;

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
                      left: Get.width * 0.18,
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                    ),
                  ),
                  hint: const Padding(
                    padding: EdgeInsets.symmetric(
                        // horizontal: 4,
                        ),
                    child: Text(
                      "e스포츠 카테고리",
                    ),
                  ),
                  value: _selectedeSports,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedeSports = newValue;
                    });
                  },
                  items: _esportsItems.map((item) {
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
              _selectedeSports != null
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
                          controller: controller.esportsController,
                          onChanged: (value) {
                            logger.i(controller.esportsController.text);
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
