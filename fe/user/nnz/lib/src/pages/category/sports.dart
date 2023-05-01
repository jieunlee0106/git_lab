import 'package:flutter/material.dart';
import 'package:nnz/src/components/category/category_dropdown.dart';

class SportsPage extends StatefulWidget {
  const SportsPage({Key? key}) : super(key: key);

  @override
  _SportsPageState createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
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
