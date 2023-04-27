import 'package:flutter/material.dart';
import 'package:nnz/src/components/gray_line_form/gray_line.dart';

import 'package:nnz/src/components/icon_data.dart';
import 'package:nnz/src/components/my_page_form/profile_info.dart.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Center(child: Image.asset(ImagePath.logo, width: 80)),
          actions: [Icon(Icons.notifications)],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Row(
                  children: [MyProfile()],
                ),
                SizedBox(
                  height: 20,
                ),
                GrayLine(),
                Column(
                  children: [],
                ),
              ],
            ),
          ),
        ));
  }
}
