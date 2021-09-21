import 'package:flutter/material.dart';

class ScrollWidget extends StatelessWidget {
  final List<String> bookTitles;
  const ScrollWidget({Key? key, required this.bookTitles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(bookTitles.isNotEmpty);

    return Scaffold(
      body: ListView(
        children: bookTitles.map((e) => ListTile(title: Text(e))).toList(),
      ),
    );
  }
}
