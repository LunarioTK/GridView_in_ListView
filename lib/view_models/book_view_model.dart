import 'package:flutter/material.dart';
import 'package:gridview_in_listwiew/model/book_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BookViewModel extends ChangeNotifier {
  //late Box<BookModel> _box;
  List bookList = [];
  List<String> filePathList = [];

  /*List<String?> get filePathList {
    return bookList.map((book) => book.filePath).toList();
  }*/

  //box
  final _mybox = Hive.box('books');

  //Loading data from box
  void loadData() {
    bookList = _mybox.get("BOOKLIST");
    //filePathList = _mybox.get("BOOKLIST");
  }

  //Update box
  void updateData() {
    _mybox.put('BOOKLIST', bookList);
  }

  /*Future<void> init() async {
    _box = await Hive.openBox('books');
  }

  Future<void> initHive() async {
    Hive.initFlutter();
    _box = await Hive.openBox('books');
  }

  List<BookModel> get books {
    return _box.values.toList();
  }*/

  /*List<BookModel> get books {
    return _box.values.map((dynamic value) {
      final map = value as Map<dynamic, dynamic>;
      return BookModel(
        title: map['title'] as String,
        file: map['file'] as File,
      );
    }).toList();
  }*/

  Future<void> addBooks({
    String? title,
    required String filePath,
  }) async {
    final bookModel = BookModel(
      title: title,
      filePath: filePath,
    );
    for (var book in bookList) {
      if (book is BookModel) {
        filePathList.add(book.filePath!);
      }
    }
    bookList.add(bookModel);
    // _box.add({'title': title, 'file': file});
    notifyListeners();
  }

  /*Future<void> removeBooks({
    required int index,
  }) async {
    await _box.deleteAt(index);
    notifyListeners();
  }*/
}
