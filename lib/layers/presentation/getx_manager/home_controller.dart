import 'dart:developer';

import 'package:get/get.dart';
import '../../data/database/databasehelper.dart';
import '../../domain/model/book_model.dart';

class HomeController extends GetxController {
  bool _getBookItemInProgress = false;
  BookListModel _bookListModel = BookListModel();

  bool get getBookItemInProgress => _getBookItemInProgress;
  BookListModel get bookListModel => _bookListModel;

  Future<bool> getBookList() async {
    _getBookItemInProgress = true;
    update();
    List<Map<String, dynamic>> bookList =
        await DatabaseHelper.getDataFromDatabase('books');
    _getBookItemInProgress = false;

    if (bookList.isNotEmpty) {
      log('bookList');
      log(bookList.toString());
      _bookListModel = BookListModel.fromJson(bookList);

      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
