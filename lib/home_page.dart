import 'package:flutter/material.dart';
import 'package:tests/widgets/scroll_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: ScrollWidget(bookTitles: List.generate(10, (index) => "Book $index")),
    );
  }
}
