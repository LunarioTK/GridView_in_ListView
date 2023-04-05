import 'package:flutter/material.dart';
import 'package:gridview_in_listwiew/model/bookinfo_model.dart';
import 'package:gridview_in_listwiew/view/home_view.dart';
import 'package:gridview_in_listwiew/view_models/book_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BookViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookInfo(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
