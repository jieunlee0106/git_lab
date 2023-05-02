import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nnz/src/components/sharing_detail/perform_detail.dart';
import 'package:nnz/src/components/sharing_detail/perform_share_card.dart';
import 'package:nnz/src/controller/list_scroll_controller.dart';

import 'package:nnz/src/components/sharing_detail/sharing_tag.dart';
import 'package:nnz/src/config/config.dart';
import 'package:nnz/src/pages/share/sharing_detail.dart';

class SharePerfomDetail extends StatelessWidget {
  SharePerfomDetail({super.key});

  final scrollControlloer = Get.put(InfiniteScrollController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: const Icon(Icons.account_circle),
        actions: const [Icon(Icons.notifications)],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(color: Color(0xFFE7E6E6)),
                width: double.infinity,
                height: 175,
              ),
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Peak Festival 2023",
                      style: TextStyle(fontSize: 24, color: Config.blackColor),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          "assets/images/sharing_sample/peakfestival.gif",
                          height: 150,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                PerformDetail(
                                    performTitle: "난지 한강공원",
                                    iconName: Icons.room,
                                    textSize: 16),
                                PerformDetail(
                                    performTitle: "2023.05.27",
                                    iconName: Icons.calendar_month,
                                    textSize: 16),
                                PerformDetail(
                                    performTitle: "전체관람가",
                                    iconName: Icons.person,
                                    textSize: 16),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("공연 예매하러 가기"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.arrow_forward)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: HashTagBadge(
              tags: {
                '#Peak': Color(0xFFF3C906),
                '#페스티벌': Color(0xFFF3C906),
                '#2023': Color(0xFFF3C906),
                '#전정국': Color(0xFFF3C906),
                '#BTS': Color(0xFFF3C906),
                '#포카나눔': Color(0xFFF3C906),
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Obx(
              () => SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    controller: scrollControlloer.scrollController.value,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (_, index) {
                      if (index < scrollControlloer.data.length) {
                        var datum = scrollControlloer.data[index];

                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () => Get.to(() => SharingDetail()),
                            child: ShareCard(datum: datum),
                          ),
                        );
                      }
                      if (scrollControlloer.hasMore.value ||
                          scrollControlloer.isLoading.value) {
                        return const Center(child: RefreshProgressIndicator());
                      }
                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        child: const Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("더이상 나눔이"),
                              Text("존재하지 않습니다"),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: scrollControlloer.data.length + 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
