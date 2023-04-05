import 'dart:io';

class BookModel {
  final File file;
  final String? title;
  final String? author;
  final int? bookId;

  BookModel({this.title, this.bookId, this.author, required this.file});
}
