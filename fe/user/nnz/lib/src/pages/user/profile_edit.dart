import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:nnz/src/components/icon_data.dart';
import 'package:nnz/src/components/my_page_form/profile_info.dart.dart';
import 'package:nnz/src/components/my_page_form/my_follower.dart';
import 'package:nnz/src/components/my_page_form/sharing_info.dart';
import 'package:nnz/src/components/gray_line_form/gray_line.dart';
import 'package:nnz/src/components/my_page_form/profile_img_change.dart';

import 'package:nnz/src/config/config.dart';
import 'package:nnz/src/pages/share/my_shared_list.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

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
          actions: [Icon(Icons.more_vert)],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 35),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Config.yellowColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 40,
                        width: 200,
                        child: Align(
                          alignment: Alignment(0.0, 0.0),
                          child: Text(
                            '프로필 사진 변경',
                            style: TextStyle(
                                color: Config.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                GrayLine(),
                Column(
                  children: [
                    // 닉네임
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '닉네임',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Config.blackColor),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 260,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Config.yellowColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: 40,
                                    width: 90,
                                    child: Align(
                                      alignment: Alignment(0.0, 0.0),
                                      child: Text(
                                        '중복 확인',
                                        style: TextStyle(
                                            color: Config.blackColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // 새로운 비밀번호
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '새로운 비밀번호',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Config.blackColor,
                                  ),
                                ),
                              ),
                              Container(
                                width: 370,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // 비밀 번호 변경 확인
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '새로운 비밀번호',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Config.blackColor,
                                  ),
                                ),
                              ),
                              Container(
                                width: 370,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // 회원 탈퇴 버튼
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 36,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Config.yellowColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 40,
                            width: 90,
                            child: Align(
                              alignment: Alignment(0.0, 0.0),
                              child: Text(
                                '회원 탈퇴',
                                style: TextStyle(
                                    color: Config.blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
