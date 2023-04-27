// import 'package:flutter/material.dart';

// class HomsShareList extends StatefulWidget {
//   final List<String> imageUrls;

//   HomsShareList({required this.imageUrls});

//   @override
//   _ImageSliderState createState() => _ImageSliderState();
// }

// class _ImageSliderState extends State<HomsShareList> {
//   final _pageController = PageController(viewportFraction: 0.8);
//   int _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController.addListener(() {
//       setState(() {
//         _currentPage = _pageController.page!.round();
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: PageView.builder(
//         controller: _pageController,
//         itemCount: widget.imageUrls.length,
//         itemBuilder: (context, index) {
//           return AnimatedBuilder(
//             animation: _pageController,
//             builder: (context, child) {
//               double value = 1;
//               if (_pageController.position.haveDimensions) {
//                 value = _pageController.page! - index;
//                 value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
//               }
//               return Center(
//                 child: SizedBox(
//                   height: Curves.easeInOut.transform(value) * 150,
//                   width: Curves.easeInOut.transform(value) * 150,
//                   child: child,
//                 ),
//               );
//             },
//             child: Image.network(
//               widget.imageUrls[index],
//               fit: BoxFit.cover,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Slider Example'),
//       ),
//       body: Center(
//         child: HomsShareList(
//           imageUrls: [
//             'https://m.insideobject.com/web/product/big/202209/392267ac3443e0d65932bc74bdbf1c71.png',
//             'https://m.insideobject.com/web/product/big/202209/392267ac3443e0d65932bc74bdbf1c71.png',
//             'https://m.insideobject.com/web/product/big/202209/392267ac3443e0d65932bc74bdbf1c71.png',
//           ],
//         ),
//       ),
//     );
//   }
// }
