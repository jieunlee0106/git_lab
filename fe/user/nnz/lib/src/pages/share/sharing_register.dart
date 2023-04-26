import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/sharing_register_form/authenticaion.dart';
import '../../components/sharing_register_form/condition_container.dart';
import '../../components/sharing_register_form/detail_info.dart';
import '../../components/sharing_register_form/hash_tag.dart';
import '../../components/sharing_register_form/images.dart';
import '../../components/sharing_register_form/open_timer.dart';
import '../../components/sharing_register_form/people_count.dart';
import '../../components/sharing_register_form/performance_time.dart';
import '../../components/sharing_register_form/sharing_btn.dart';
import '../../components/sharing_register_form/sharing_choice.dart';
import '../../components/sharing_register_form/sharing_title.dart';
import '../../controller/sharing_register_controller.dart';

class SharingRegister extends StatelessWidget {
  SharingRegister({super.key});
  final controller = Get.put(SharingRegisterController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Images(),
                  const SizedBox(
                    height: 16,
                  ),
                  SharingChoice(),
                  const SizedBox(
                    height: 16,
                  ),
                  const PerformanceTime(),
                  const SizedBox(
                    height: 16,
                  ),
                  SharingTitle(),
                  const SizedBox(
                    height: 16,
                  ),
                  const OpenTime(),
                  const SizedBox(
                    height: 16,
                  ),
                  const Authentication(),
                  Obx(
                    () => controller.isAuthentication.value == true
                        ? const Column(
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              ConditionContainer()
                            ],
                          )
                        : Container(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const PeopleCount(),
                  const SizedBox(
                    height: 16,
                  ),
                  DetailInfo(),
                  const SizedBox(
                    height: 16,
                  ),
                  HashTag(),
                  const SizedBox(
                    height: 56,
                  ),
                  SharingBtn(),
                ],
              ),
            ),
          )),
    );
  }
}
