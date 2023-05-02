import 'package:flutter/material.dart';

class MySharedDetail extends StatelessWidget {
  const MySharedDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: const Icon(Icons.account_circle),
        actions: const [Icon(Icons.notifications)],
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
