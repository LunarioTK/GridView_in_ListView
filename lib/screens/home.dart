import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 10,
            width: 5,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
