import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gridview_in_listwiew/model/book_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BookViewModel extends ChangeNotifier {
  Box _box = Hive.box('books');

  Future<void> init() async {
    _box = await Hive.openBox('books');
  }

  Future<void> initHive() async {
    Hive.initFlutter();
    _box = await Hive.openBox('books');
  }

  List<BookModel> get books {
    return _box.values.map((dynamic value) {
      final map = value as Map<dynamic, dynamic>;
      return BookModel(
        title: map['title'] as String,
        file: map['file'] as File,
      );
    }).toList();
  }

  Future<void> addBooks({
    required String title,
    required File file,
  }) async {
    await _box.add({'title': title, 'file': file});
    notifyListeners();
  }

  Future<void> removeBooks({
    required int index,
  }) async {
    await _box.deleteAt(index);
    notifyListeners();
  }
}
