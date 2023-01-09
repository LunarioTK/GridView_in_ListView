import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gridview_in_listwiew/utils/books.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView in a ListView'),
        elevation: 0,
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        children: [
          StaggeredGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            children: const [
              Books(),
              Books(),
              Books(),
              Books(),
              Books(),
              Books(),
              Books(),
              Books(),
              Books(),
              Books(),
              Books(),
            ],
          ),
        ],
      ),
    );
  }
}
