import 'package:flutter/material.dart';
import 'package:gridview_in_listwiew/model/bookinfo_model.dart';
import 'package:gridview_in_listwiew/view/colors_view.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

import 'package:provider/provider.dart';

class Book extends StatelessWidget {
  String? filePath;
  int? index;
  Book({super.key, this.index, required this.filePath});

  @override
  Widget build(BuildContext context) {
    var bookInfo = context.watch<BookInfo>();

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              print(filePath);
            },
            child: Material(
              elevation: 10,
              child: PdfDocumentLoader.openFile(
                filePath ?? bookInfo.getFile.path,
                pageNumber: 1,
                pageBuilder: (context, textureBuilder, pageSize) =>
                    textureBuilder(
                  size: const Size(80, 120),
                ),
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '__________',
            style: TextStyle(
              color: smallTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
