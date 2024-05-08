import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:irdfoundationtask/layers/domain/model/chapter_model.dart';
import '../../data/database/databasehelper.dart';

class ChapterScreenController extends GetxController {
  bool _getChapterItemInProgress = false;
  ChapterListModel _chapterListModel = ChapterListModel();
  final TextEditingController _searchController = TextEditingController();
  List<ChapterData> _filteredChapters = [];

  bool get getChapterItemInProgress => _getChapterItemInProgress;
  ChapterListModel get chapterListModel => _chapterListModel;
  TextEditingController get searchController => _searchController;
  List<ChapterData> get filteredChapters => _filteredChapters;

  Future<bool> getChapterList() async {
    _getChapterItemInProgress = true;
    update();
    List<Map<String, dynamic>> chapterList =
        await DatabaseHelper.getDataFromDatabase('chapter');
    _getChapterItemInProgress = false;

    log(chapterList.toString());

    if (chapterList.isNotEmpty) {
      _chapterListModel = ChapterListModel.fromJson(chapterList);
      _filteredChapters = _chapterListModel.data!.toList();

      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  void filterChapter(String value) {
    _getChapterItemInProgress = true;
    update();
    log(chapterListModel.data![0].title.toString());
    _filteredChapters = chapterListModel.data!
        .where((chapter) =>
            chapter.title!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    log(_filteredChapters.toString());
    _getChapterItemInProgress = false;
    update();
  }
}
