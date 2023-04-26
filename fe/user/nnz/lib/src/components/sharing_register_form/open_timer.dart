import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:platform_date_picker/platform_date_picker.dart';

import '../../config/config.dart';
import '../icon_data.dart';

class OpenTime extends StatefulWidget {
  const OpenTime({super.key});

  @override
  State<OpenTime> createState() => _OpenTimeState();
}

class _OpenTimeState extends State<OpenTime> {
  final logger = Logger();
  TimeOfDay time = TimeOfDay.now();
  DateTime date = DateTime.now();
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
                  icon: ImagePath.calendar,
                  size: 80,
                ),
                const SizedBox(
                  width: 12,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    bottom: 4,
                  ),
                  child: Text(
                    "오픈시간",
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
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Config.blackColor,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 16,
                          ),
                          child: Text(
                            "yyyy-mm-dd",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        MaterialButton(
                          minWidth: 60,
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 30,
                            ),
                            child: Icon(
                              Icons.calendar_today,
                            ),
                          ),
                          onPressed: () async {
                            DateTime? temp = await PlatformDatePicker.showDate(
                              context: context,
                              firstDate: DateTime(DateTime.now().year),
                              initialDate: DateTime.now(),
                              lastDate: DateTime(DateTime.now().year + 5),
                            );
                            if (temp != null) setState(() => date = temp);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Config.blackColor,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Text(
                            "hh:mm",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        MaterialButton(
                          minWidth: 20,
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 4,
                            ),
                            child: Icon(
                              Icons.timer,
                            ),
                          ),
                          onPressed: () async {
                            TimeOfDay? temp = await PlatformDatePicker.showTime(
                              use24hFormat: true,
                              context: context,
                              initialTime: time,
                              showCupertino: true,
                              showMaterial: true,
                              height: 200,
                            );
                            setState(() => time = temp!);
                            logger.i(time);
                          },
                        ),
                      ],
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
