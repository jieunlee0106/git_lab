import 'package:flutter/material.dart';

class HomeCategory extends StatelessWidget {
  final String categoryName;
  final String image;
  final int num;
  final Widget page;

  HomeCategory(
      {super.key,
      required this.image,
      required this.categoryName,
      required this.num,
      required this.page});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: SizedBox(
        height: 60,
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                        image: AssetImage(image),
                        width: 35,
                        height: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(categoryName),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
