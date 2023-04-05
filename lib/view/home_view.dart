import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:gridview_in_listwiew/model/bookinfo_model.dart';
import 'package:gridview_in_listwiew/view/book_view.dart';
import 'package:gridview_in_listwiew/view/colors_view.dart';
import 'package:gridview_in_listwiew/view_models/book_view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 0;
  File file = File('');
  List<int> indexs = [];

  @override
  Widget build(BuildContext context) {
    var bookInfo = context.watch<BookInfo>();
    MediaQueryData media = MediaQuery.of(context);
    double height = media.size.height;
    double width = media.size.width;

    double ratio = media.size.height / media.size.width;
    late FilePickerResult? result;

    return Scaffold(
      backgroundColor: uiColor,
      body: SafeArea(
        child: FutureBuilder(
          future: Provider.of<BookViewModel>(context, listen: false).initHive(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final bookClass =
                  Provider.of<BookViewModel>(context, listen: true);
              final books = bookClass.books;
              return Stack(
                children: [
                  file.path == ''
                      ? Container()
                      : GridView.builder(
                          clipBehavior: Clip.none,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: height <= 600 ? 1 / 3 : 2 / 3,
                          ),
                          itemCount: books.length,
                          itemBuilder: (BuildContext context, int index) {
                            final book = books[index];
                            return Book(
                              file: book.file,
                              index: index,
                            );
                          },
                        ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: FloatingActionButton(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        onPressed: (() async {
                          result = null;
                          result = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf'],
                          );
                          if (result != null) {
                            file = File(result!.files.single.path!);
                            if (!books.contains(file)) {
                              bookClass.addBooks(title: '', file: file);
                            }
                            bookInfo.setFile = file;
                            count++;
                            bookInfo.setbooksAdded = count;
                          }
                        }),
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/bookbgrm.png',
                              height: height * 0.20,
                              width: width * 0.20,
                            ),
                            const Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                Icons.add,
                                weight: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

//'assets/bookwithapplebgrm.png'