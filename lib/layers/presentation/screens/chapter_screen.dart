import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irdfoundationtask/layers/presentation/getx_manager/chapter_screen_controller.dart';
import 'package:irdfoundationtask/layers/presentation/screens/hadith_screen.dart';
import 'package:irdfoundationtask/layers/presentation/widgets/hexagon_painter.dart';

import '../utils/constants.dart';

class ChapterScreen extends StatelessWidget {
  const ChapterScreen(
      {super.key,
      required this.title,
      required this.noOfHadith,
      required this.boolId});

  final String boolId;
  final String title;
  final String noOfHadith;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppConstants.appBarTitle,
            ),
            Text(
              "$noOfHadith টি হাদিস",
              style: AppConstants.bnTextStyle.copyWith(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: Material(
        color: AppConstants.primaryColor,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            // color: Color(0xFFE1E1E1),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: GetBuilder<ChapterScreenController>(
              builder: (chapterScreenController) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Column(
                children: [
                  Card(
                    elevation: 1,
                    child: TextField(
                      controller: chapterScreenController.searchController,
                      onChanged: chapterScreenController.filterChapter,
                      decoration: const InputDecoration(
                        hintText: 'অধ্যায় সার্চ করুন',
                        hintStyle: AppConstants.bnTextStyle,
                        suffixIcon: Icon(
                          Icons.search_sharp,
                          size: 40,
                          color: Colors.blueGrey,
                        ),
                        prefixIconColor: AppConstants.primaryColor,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0,
                                color: Colors.white,
                                style: BorderStyle.none)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0,
                                color: Colors.white,
                                style: BorderStyle.none)),
                        labelStyle: TextStyle(color: AppConstants.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: chapterScreenController.getChapterItemInProgress
                        ? const Center(child: LinearProgressIndicator())
                        : ListView.builder(
                            itemCount:
                                chapterScreenController.filteredChapters.length,
                            itemBuilder: (context, index) {
                              final chapter = chapterScreenController
                                  .filteredChapters[index];
                              return InkWell(
                                onTap: () {
                                  Get.to(HadithScreen(
                                      title: title,
                                      chapterName:
                                          '${chapterScreenController.chapterListModel.data?[index].title}'));
                                },
                                child: Card(
                                  elevation: 1,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      leading: Container(
                                        margin: const EdgeInsets.all(8),
                                        width: 35,
                                        height: 37,
                                        child: CustomPaint(
                                          painter: HexagonPainter(
                                            color: AppConstants.primaryColor,
                                            abvrCode: '${chapter.number}',
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        '${chapter.title}',
                                        style: AppConstants.cardTitle,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      subtitle: Text(
                                        "হাদিসের রেঞ্জ: ${chapter.hadisRange}",
                                        style: AppConstants.bnTextStyle,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
