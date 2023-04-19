import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gridview_in_listwiew/model/book_model.dart';

class BookInfo extends ChangeNotifier {
  static final BookInfo _instance = BookInfo._internal();

  factory BookInfo() {
    return _instance;
  }

  BookInfo._internal();

  File _file = File('path');
  int _pageNumber = 0;
  int _booksAdded = 0;
  List<int> pages = [];
  final List<BookModel> _books = [];
  final StreamController<int> _allViewedPagesStream =
      StreamController<int>.broadcast();
  Stream<int> _broadcastStream = const Stream.empty();

  // Getting books available
  List<BookModel> get allBooks {
    return _books;
  }

  // Setting File
  set setFile(File newFile) {
    _file = newFile;
    _books.add(BookModel(bookId: getbooksAdded, filePath: newFile.path));
    //notifyListeners();
  }

  // Getting File
  File get getFile {
    return _file;
  }

  // Setting Page Number
  set setPageNumber(int newPageNumber) {
    _pageNumber = newPageNumber;
    //notifyListeners();
  }

  // Getting Page Number
  int get getPageNumber {
    return _pageNumber;
  }

  // Setting Page Number
  set setbooksAdded(int newbooksAdded) {
    _booksAdded = newbooksAdded;
    notifyListeners();
  }

  // Getting Page Number
  int get getbooksAdded => _booksAdded;

  // Set List of pages viewed
  Set? setListBooks(int page) {
    pages.add(page);
    return null;
  }

  // Set List of pages viewed in a stream
  Set? setStreamPages(int page) {
    _allViewedPagesStream.add(page);
    return null;
  }

  // Get Stream
  Stream<int> get getPagesStream =>
      _allViewedPagesStream.stream.asBroadcastStream();

  //Future<void> closeStream() => _allViewedPagesStream.close();
  void disposeStream() => _allViewedPagesStream.close();

  // Clear Stream
  void clearStream() async {
    await _broadcastStream.drain();
    _allViewedPagesStream.addStream(_broadcastStream);
  }

  // Set as BroadCastStream
  Set? setAsBroadcastStream(StreamController<int> stream) {
    _broadcastStream = stream.stream.asBroadcastStream();
    return null;
  }

  // Get BroadcastStream
  Stream get getBroadcastStream => _broadcastStream;
}
