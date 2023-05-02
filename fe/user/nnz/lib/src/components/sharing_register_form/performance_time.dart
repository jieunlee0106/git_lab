import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nnz/src/components/icon_data.dart';
import 'package:nnz/src/config/config.dart';
import 'package:nnz/src/controller/sharing_register_controller.dart';
import 'package:platform_date_picker/platform_date_picker.dart';

class PerformanceTime extends StatefulWidget {
  const PerformanceTime({Key? key}) : super(key: key);

  @override
  _PerformanceTimeState createState() => _PerformanceTimeState();
}

class _PerformanceTimeState extends State<PerformanceTime> {
  DateTime date = DateTime.now();
  final controller = Get.put(SharingRegisterController());
  final logger = Logger();
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
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconData(
                  icon: ImagePath.calendar,
                  size: 80,
                ),
                const SizedBox(
                  width: 12,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    bottom: 4.0,
                  ),
                  child: Text(
                    "공연 시간",
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
            margin: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width * 0.45,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Config.blackColor,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.performStartController,
                            decoration: const InputDecoration(
                              hintText: "공연 시작일",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () async {
                              DateTime? temp =
                                  await PlatformDatePicker.showDate(
                                context: context,
                                firstDate: DateTime(DateTime.now().year),
                                initialDate: DateTime.now(),
                                lastDate: DateTime(DateTime.now().year + 5),
                              );
                              if (temp != null) {
                                setState(() {
                                  date = temp;
                                });
                              }
                              final dateFormat =
                                  date.toString().substring(0, 10);
                              controller.performStartController.text =
                                  dateFormat;
                            },
                            child: const Icon(Icons.calendar_today)),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: Get.width * 0.4,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Config.blackColor,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.performEndController,
                            decoration: const InputDecoration(
                              hintText: "공연 종료일",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () async {
                              DateTime? temp =
                                  await PlatformDatePicker.showDate(
                                context: context,
                                firstDate: DateTime(DateTime.now().year),
                                initialDate: DateTime.now(),
                                lastDate: DateTime(DateTime.now().year + 5),
                              );
                              if (temp != null) {
                                setState(() {
                                  date = temp;
                                });
                              }
                              final dateFormat =
                                  date.toString().substring(0, 10);
                              controller.performEndController.text = dateFormat;
                            },
                            child: const Icon(Icons.calendar_today)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
