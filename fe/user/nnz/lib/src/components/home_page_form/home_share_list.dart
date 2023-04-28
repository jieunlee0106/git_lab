import 'package:flutter/material.dart';
import 'package:nnz/src/config/config.dart';
import 'package:marquee/marquee.dart';

//**
//
// 이미지, text3, number API 데이터로 수정
//
//
//
//*/
class HomeShareList extends StatelessWidget {
  HomeShareList({Key? key}) : super(key: key);

  final List<Map<String, String>> _items = [
    {
      'image':
          'https://m.mondayfactory.co.kr/web/product/big/202202/a97bb63cf83efe18a9955b68d1476983.jpg',
      'title': '한화 vs 키움',
      'subtitle': '직접만든 한화 류현진 응원봉',
      'location': '대전 한화 이글스파크'
    },
    {
      'image':
          'https://www.thinkfood.co.kr/news/photo/202011/89224_115703_256.jpg',
      'title': '2023 빙그레즈 단독 투어',
      'subtitle': '바나나빙그레 X 흑임자 비비빅 굿즈',
      'location': '경기 고양시 일산 동구'
    },
    {
      'image':
          'https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202109/27/78c06661-48fb-4f72-8e9b-2c7bd6e0ba82.jpg',
      'title': '공연 제목 입력란',
      'subtitle': '나눔 제목 입력란',
      'location': '공연 장소'
    },
    {
      'image':
          'https://blog.jandi.com/ko/wp-content/uploads/sites/4/2022/01/%EC%9E%94%EB%94%94%EA%B5%BF%EC%A6%88_%EC%A2%85%ED%95%A9%EB%AA%A9%EC%97%85-1.jpg',
      'title': '공연 제목 입력란',
      'subtitle': '나눔 제목 입력하세요~',
      'location': '공연 장소 상암'
    },
    {
      'image':
          'https://image.newdaily.co.kr/site/data/img/2019/10/14/2019101400025_0.jpg',
      'title': '공연 제목 입력란',
      'subtitle': '나눔 제목 입력하세요~',
      'location': '공연 장소 상암'
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': '공연 제목 입력란',
      'subtitle': '나눔 제목 입력하세요~',
      'location': '공연 장소 상암'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _items
            .map(
              (item) => Container(
                width: 150,
                height: 200,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      height: 130,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 253, 253),
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(item['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title']!,
                            style: TextStyle(
                              color: Color.fromARGB(255, 11, 40, 126),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 3),
                          Text(
                            item['subtitle']!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              overflow: TextOverflow.ellipsis,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 3),
                          Text(
                            item['location']!,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
