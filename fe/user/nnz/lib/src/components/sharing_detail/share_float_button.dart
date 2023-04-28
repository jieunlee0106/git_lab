import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nnz/src/components/sharing_detail/sharing_timer.dart';
import 'package:nnz/src/config/config.dart';
import "../../controller/shareingdetail_controller.dart";
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

class PurchaseButton extends StatelessWidget {
  PurchaseButton({super.key});
  final controller = Get.put(ShareDetailController());
  final duration = const Duration(days: 0, hours: 2, minutes: 15, seconds: 20);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Config.yellowColor),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: Image(
                              image: AssetImage(
                                  "assets/images/sharing_sample/sharingstop.png")),
                        ),
                        Text(
                          "잠깐!",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "인증이 필요한 나눔입니다",
                      style: TextStyle(fontSize: 11, color: Color(0xFF838282)),
                    ),
                    SizedBox(
                      width: 370,
                      height: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {},
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: MultiImagePickerView(
                              controller: controller.authImageController,
                              addButtonTitle: ""),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 370,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Config.yellowColor),
                        onPressed: () {},
                        child: Container(
                          decoration: BoxDecoration(color: Config.yellowColor),
                          child: Text(
                            '나눔 받기',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Config.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
            decoration: BoxDecoration(color: Config.yellowColor),
            child: SharingDateTimer(
              duration: duration,
              onTimerFinished: () => const Text("끝"),
            )),
      ),
    );
  }
}
