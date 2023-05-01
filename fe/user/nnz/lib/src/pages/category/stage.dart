import 'package:flutter/material.dart';
import 'package:nnz/src/components/category/category_dropdown.dart';

class StagePage extends StatefulWidget {
  const StagePage({Key? key}) : super(key: key);

  @override
  _StagePageState createState() => _StagePageState();
}

class _StagePageState extends State<StagePage> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CategoryDropdown(
          items: <String>['콘서트', '뮤지컬', '연극', '영화', '스포츠', 'e스포츠'],
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
