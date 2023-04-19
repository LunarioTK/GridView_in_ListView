import 'package:flutter/material.dart';
import 'package:gridview_in_listwiew/model/book_model.dart';
import 'package:gridview_in_listwiew/model/bookinfo_model.dart';
import 'package:gridview_in_listwiew/view/home_view.dart';
import 'package:gridview_in_listwiew/view_models/book_view_model.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Register the BookModelAdapter
  Hive.registerAdapter<BookModel>(BookModelAdapter());

  // Open box
  final box = await Hive.openBox('books');

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
