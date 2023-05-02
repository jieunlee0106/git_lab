import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../config/config.dart';
import '../../controller/sharing_register_controller.dart';

class ShareAlert extends StatefulWidget {
  const ShareAlert({super.key});

  @override
  State<ShareAlert> createState() => _ShareAlertState();
}

class _ShareAlertState extends State<ShareAlert> {
  final logger = Logger();

  final controller = Get.put(SharingRegisterController());
  final List<String> _items = ['콘서트', '뮤지컬', '연극', '영화', '스포츠', 'e스포츠'];
  final List<String> _sportsItems = ['축구', '야구', '농구'];
  final List<String> _esportsItems = ['LCK', '스타크래프트'];

  String? _selectedItem;
  String? _selectedSports;
  String? _selectedeSports;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          title: const Text(
            "공연선택",
            style: TextStyle(fontSize: 16),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SingleChildScrollView(
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
                          left: Get.width * 0.3,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                        ),
                      ),
                      hint: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Text(
                          "나눔 카테고리",
                        ),
                      ),
                      alignment: Alignment.center,
                      value: _selectedItem,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                      items: _items.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 60,
                            ),
                            child: Text(item),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  _selectedItem == '콘서트'
                      ? Column(
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
                        )
                      : Container(),
                  _selectedItem == '뮤지컬'
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search),
                              ),
                              controller: controller.musicalController,
                              onChanged: (value) {
                                logger.i(controller.sportsController.text);
                                controller.testText(value);
                              },
                            ),
                          ],
                        )
                      : Container(),
                  _selectedItem == '연극'
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search),
                              ),
                              controller: controller.theaterController,
                              onChanged: (value) {
                                logger.i(controller.sportsController.text);
                                controller.testText(value);
                              },
                            ),
                          ],
                        )
                      : Container(),
                  _selectedItem == '영화'
                      ? Column(
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
                        )
                      : Container(),
                  _selectedItem == '스포츠'
                      ? Column(
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
                                      padding:
                                          const EdgeInsetsDirectional.symmetric(
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
                                              controller:
                                                  controller.sportsController,
                                              onChanged: (value) {
                                                logger.i(controller
                                                    .sportsController.text);
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
                        )
                      : Container(),
                  _selectedItem == 'e스포츠'
                      ? Column(
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
                                      padding:
                                          const EdgeInsetsDirectional.symmetric(
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
                                              controller:
                                                  controller.sportsController,
                                              onChanged: (value) {
                                                logger.i(controller
                                                    .sportsController.text);
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
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                controller.onChange(controller.testText.value);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Config.yellowColor,
                    borderRadius: BorderRadius.circular(
                      8,
                    )),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Text(
                  '선택완료',
                  style: TextStyle(
                    color: Config.blackColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
