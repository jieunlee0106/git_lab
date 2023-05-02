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
  String? dropdownValue;

  final List<String> _images = [
    'https://picsum.photos/id/237/200/300',
    'https://picsum.photos/id/238/200/300',
    'https://picsum.photos/id/239/200/300',
  ];

  @override
  Widget build(BuildContext context) {
    String sportEvent = ImagePath.bsbB;
    return Scaffold(
      appBar: AppBar(
        title: CategoryDropdown(
          items: <String>['콘서트', '뮤지컬', '연극', '영화', '스포트', 'e스포츠'],
          cartegory: '스포츠',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(sportEvent),
                fit: BoxFit.cover,
              ),
            ),
            child: Transform.translate(
              offset: Offset(0, 50),
              child: Center(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 800,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 1,
                  ),
                  items: _images.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        int index = _images.indexOf(image);
                        String assetImage;

                        if (index == 0) {
                          assetImage = ImagePath.socB;
                          sportEvent = ImagePath.socB;
                        } else if (index == 1) {
                          assetImage = ImagePath.bsbB;
                          sportEvent = ImagePath.bsbB;
                        } else {
                          assetImage = ImagePath.bkbB;
                          sportEvent = ImagePath.bkbB;
                          ;
                        }
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(assetImage),
                              // fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
