import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:nnz/src/components/banner_form/home_banner.dart';
import 'package:nnz/src/components/home_page_form/category_form.dart';

import 'package:nnz/src/pages/category/concert.dart';
import 'package:nnz/src/pages/category/movie.dart';
import 'package:nnz/src/pages/category/musical.dart';
import 'package:nnz/src/pages/category/sports.dart';
import 'package:nnz/src/pages/category/esports.dart';
import 'package:nnz/src/pages/category/stage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          leading: Icon(Icons.account_circle),
          title: Center(child: Image.asset('assets/logo.png', width: 100)),
          actions: [Icon(Icons.notifications)],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                items: [
                  HomeBanner(
                    image: 'assets/banner1.png',
                    num: 1,
                  ),
                  HomeBanner(
                    image: 'assets/banner2.png',
                    num: 1,
                  ),
                  HomeBanner(
                    image: 'assets/banner3.png',
                    num: 1,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeCategory(
                        page: ConcertPage(),
                        image: 'assets/concert.png',
                        categoryName: '콘서트',
                        num: 1),
                    HomeCategory(
                        page: musicalPage(),
                        image: 'assets/musical.png',
                        categoryName: '뮤지컬',
                        num: 1),
                    HomeCategory(
                      page: stagePage(),
                      image: 'assets/stage.png',
                      categoryName: '연극',
                      num: 1,
                    ),
                    HomeCategory(
                      page: moviePage(),
                      image: 'assets/movie.png',
                      categoryName: '영화',
                      num: 1,
                    ),
                    HomeCategory(
                        page: sportsPage(),
                        image: 'assets/sports.png',
                        categoryName: '스포츠',
                        num: 1),
                    HomeCategory(
                        page: esportsPage(),
                        image: 'assets/esports.png',
                        categoryName: 'e스포츠',
                        num: 1),
                  ],
                ),
              ),
              // Add other widgets here...
            ],
          ),
        ));
  }
}
