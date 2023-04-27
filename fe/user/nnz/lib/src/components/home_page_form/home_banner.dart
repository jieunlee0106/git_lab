import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  final String image;
  final int num;

  HomeBanner({
    super.key,
    required this.image,
    required this.num,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
