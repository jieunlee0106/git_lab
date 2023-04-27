import 'package:flutter/material.dart';
import 'package:get/get.dart';

class iconData extends StatelessWidget {
  final String icon;
  final double? size;

  const iconData({
    super.key,
    required this.icon,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      width: size! / Get.mediaQuery.devicePixelRatio,
    );
  }
}

class ImagePath {
  static String get twitter => 'assets/images/login/twitter.png';
  static String get id => 'assets/images/login/id.png';
  static String get homeOn => 'assets/images/bottom_navigator/home_on.png';
  static String get homeOff => 'assets/images/bottom_navigator/home_off.png';
  static String get searchOn => 'assets/images/bottom_navigator/search_on.jpg';
  static String get searchOff =>
      'assets/images/bottom_navigator/search_off.jpg';
  static String get upload => 'assets/images/bottom_navigator/upload.jpg';
  static String get favoriteOn =>
      'assets/images/bottom_navigator/favorite_on.jpg';
  static String get favoriteOff =>
      'assets/images/bottom_navigator/favorite_off.jpg';
  static String get mypageOn => 'assets/images/bottom_navigator/mypage_on.jpg';
  static String get mypageOff =>
      'assets/images/bottom_navigator/mypage_off.jpg';
  static String get addImage => 'assets/images/sharing_register/add_image.png';
  static String get choice => 'assets/images/sharing_register/choice.png';
  static String get calendar => 'assets/images/sharing_register/calendar.png';
  static String get certification =>
      'assets/images/sharing_register/certification.png';
  static String get detailInfo =>
      'assets/images/sharing_register/detail_info.png';
  static String get peopleCount =>
      'assets/images/sharing_register/people_count.png';
  static String get title => 'assets/images/sharing_register/title.png';
  static String get hashTag => 'assets/images/sharing_register/hash_tag.png';
  static String get condition => 'assets/images/sharing_register/condition.png';
  static String get logo => 'assets/logo.png';
}
