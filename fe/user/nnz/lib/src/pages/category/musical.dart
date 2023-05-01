import 'package:flutter/material.dart';
import 'package:nnz/src/components/category/category_dropdown.dart';

class MusicalPage extends StatefulWidget {
  const MusicalPage({Key? key}) : super(key: key);

  @override
  _MusicalPageState createState() => _MusicalPageState();
}

class _MusicalPageState extends State<MusicalPage> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CategoryDropdown(
          items: <String>['콘서트', '뮤지컬', '연극', '영화', '스포트', 'e스포츠'],
          cartegory: '뮤지컬',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: const Text("musical 페이지"),
      ),
    );
  }
}
