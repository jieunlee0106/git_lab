import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nnz/src/controller/sharing_register_controller.dart';

import '../../config/config.dart';
import '../icon_data.dart';

class SharingChoice extends StatefulWidget {
  const SharingChoice({super.key});

  @override
  State<SharingChoice> createState() => _SharingChoiceState();
}

class _SharingChoiceState extends State<SharingChoice> {
  final logger = Logger();

  final controller = Get.put(SharingRegisterController());
  final List<String> _items = ['콘서트', '뮤지컬', '연극', '영화', '스포츠'];
  final List<String> _sportsItems = ['축구', '야구', '농구'];
  final List<String> _esportsItems = ['LCK', '스타크래프트'];

  String? _selectedItem;
  String? _selectedSports;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        children: [
          Row(
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
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * 0.7,
                  child: TextField(
                    controller: controller.sharingController,
                    decoration: const InputDecoration(
                        hintText: '공연을 선택해주세요',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    logger.i("공연 선택을 해주세요");
                    logger.i(_items);

                    showDialog(
                      context: context,
                      barrierDismissible: true, // 다이얼로그 바깥을 탭하면 닫히도록 설정
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
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
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF3F3F3),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: DropdownButton<String>(
                                        isDense: true,
                                        padding: const EdgeInsetsDirectional
                                            .symmetric(
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
                                    _selectedItem == '뮤지컬'
                                        ? Column(
                                            children: [
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Container(
                                                child: const Text("아 이거 누가짯어?"),
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
                                              Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF3F3F3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                    ),
                                                    child:
                                                        DropdownButton<String>(
                                                      isDense: true,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .symmetric(
                                                        horizontal: 16,
                                                        vertical: 12,
                                                      ),
                                                      icon: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: Get.width * 0.3,
                                                        ),
                                                        child: const Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                        ),
                                                      ),
                                                      hint: const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal: 4,
                                                        ),
                                                        child: Text(
                                                          "스포츠 카테고리",
                                                        ),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      value: _selectedSports,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          _selectedSports =
                                                              newValue;
                                                        });
                                                      },
                                                      items: _sportsItems
                                                          .map((item) {
                                                        return DropdownMenuItem(
                                                          value: item,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
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
                                                            Container(
                                                              child: Text(
                                                                  "$_selectedSports 보여줘"),
                                                            )
                                                          ],
                                                        )
                                                      : Container(),
                                                ],
                                              ),
                                            ],
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
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
                                      )),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Config.yellowColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
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
