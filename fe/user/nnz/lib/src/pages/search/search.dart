import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nnz/src/components/icon_data.dart';

import '../../components/search_form/show_search_bar.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  final controller = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: iconData(
            icon: ImagePath.logo,
            size: 240,
          ),
          centerTitle: true,
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ShowSearchBar(),
              // PopularHashTag(),
            ],
          ),
        ),
      ),
    );
  }
}
