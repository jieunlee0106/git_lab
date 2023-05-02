import 'package:flutter/material.dart';
import 'package:nnz/src/components/category/category_dropdown.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nnz/src/components/icon_data.dart';

class SportsPage extends StatefulWidget {
  const SportsPage({Key? key}) : super(key: key);

  @override
  _SportsPageState createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  String sportEvent = ImagePath.bsbB;

  final List<String> _images = [
    'https://picsum.photos/id/237/200/300',
    'https://picsum.photos/id/238/200/300',
    'https://picsum.photos/id/239/200/300',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CategoryDropdown(
          items: <String>['콘서트', '뮤지컬', '연극', '영화', '스포츠', 'e스포츠'],
          cartegory: '스포츠',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(sportEvent),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                Container(
                  height: 130,
                  child: Center(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 800,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        viewportFraction: 1,
                        onPageChanged: (int index, _) {
                          setState(() {
                            if (index == 0) {
                              sportEvent = ImagePath.socB;
                            } else if (index == 1) {
                              sportEvent = ImagePath.bsbB;
                            } else {
                              sportEvent = ImagePath.bkbB;
                            }
                          });
                        },
                      ),
                      items: _images.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            int index = _images.indexOf(image);
                            String assetImage;

                            if (index == 0) {
                              assetImage = ImagePath.socB;
                            } else if (index == 1) {
                              assetImage = ImagePath.bsbB;
                            } else {
                              assetImage = ImagePath.bkbB;
                            }
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(assetImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
