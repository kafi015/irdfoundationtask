import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irdfoundationtask/layers/presentation/getx_manager/hadith_screen_controller.dart';

import '../utils/constants.dart';
import '../widgets/hexagon_painter.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen(
      {super.key, required this.title, required this.chapterName});

  final String title;
  final String chapterName;

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
              chapterName,
              style: const TextStyle(color: Colors.white, fontSize: 16),
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
          child: GetBuilder<HadithScreenController>(
              builder: (hadithScreenController) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: hadithScreenController.getSectionItemInProgress
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount:
                          hadithScreenController.sectionListModel.data!.length,
                      itemBuilder: (context, index) {
                        final section = hadithScreenController
                            .sectionListModel.data![index];
                        final sectionHadiths = hadithScreenController
                            .hadithListModel.data!
                            .where((hadith) =>
                                hadith.sectionId == section.sectionId)
                            .toList();

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Section card
                            Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 8),
                              child: ListTile(
                                title: Text(
                                  '${section.title}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppConstants.primaryColor), // Make section number green
                                ), // Make section number green
                                subtitle: section.preface != ""
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (section.preface != "")
                                            const Divider(), // Add a divider if subtitle is not null
                                          Text(
                                            '${section.preface}', // Subtitle
                                            style: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontSize: 15),
                                          ),
                                        ],
                                      )
                                    : null,
                              ),
                            ),

                            // Hadiths within the same section
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: sectionHadiths.length,
                              itemBuilder: (context, index) {
                                final hadith = sectionHadiths[index];
                                return Card(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(8),
                                            width: 35, // Adjust size as needed
                                            height: 37, // Adjust size as needed
                                            child: CustomPaint(
                                              painter: HexagonPainter(
                                                  color:
                                                      AppConstants.secondaryColor,
                                                  abvrCode: "B"),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                title, // Placeholder text, replace with actual data
                                                style: AppConstants.cardTitle,
                                              ),
                                              Text(
                                                'হাদিস: ${hadith.hadithId}', // Placeholder text, replace with actual data
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        Colors.green.shade700),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Container(
                                            width: 73, // Adjust size as needed
                                            height: 26, // Adjust size as needed
                                            decoration: BoxDecoration(
                                              color: AppConstants
                                                  .secondaryColor, // Filled color for hadith grade
                                              borderRadius: BorderRadius.circular(
                                                  20), // Set border radius to 50
                                            ),
                                            child: Center(
                                                child: Text(
                                              '${hadith.grade}',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            )),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.more_vert),
                                            onPressed: () {
                                              showModalBottomSheet(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              ' অন্যান্য অপশন',
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            const Spacer(),
                                                            IconButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                icon: const Icon(
                                                                    Icons
                                                                        .close))
                                                          ],
                                                        ), // Placeholder text, replace with actual data
                                                        const SizedBox(
                                                            height: 16),
                                                        ListTile(
                                                          leading: const Icon(Icons
                                                              .bookmark_outline),
                                                          title: const Text(
                                                              'Add Collections'),
                                                          onTap: () {
                                                            // Handle Add Collections action
                                                          },
                                                        ),
                                                        ListTile(
                                                          leading: const Icon(
                                                              Icons
                                                                  .copy_outlined),
                                                          title: const Text(
                                                              'Copy Hadith BD'),
                                                          onTap: () {
                                                            // Handle Copy Hadith BD action
                                                          },
                                                        ),
                                                        ListTile(
                                                          leading: const Icon(
                                                              Icons
                                                                  .copy_outlined),
                                                          title: const Text(
                                                              'Copy Hadith AR'),
                                                          onTap: () {
                                                            // Handle Copy Hadith AR action
                                                          },
                                                        ),
                                                        ListTile(
                                                          leading: const Icon(
                                                              Icons
                                                                  .copy_outlined),
                                                          title: const Text(
                                                              'Copy'),
                                                          onTap: () {
                                                            // Handle Copy action
                                                          },
                                                        ),
                                                        ListTile(
                                                          leading: const Icon(Icons
                                                              .share_outlined),
                                                          title: const Text(
                                                              'Share'),
                                                          onTap: () {
                                                            // Handle Share action
                                                          },
                                                        ),
                                                        ListTile(
                                                          leading: const Icon(Icons
                                                              .report_outlined),
                                                          title: const Text(
                                                              'Report'),
                                                          onTap: () {
                                                            // Handle Report action
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${hadith.ar}',
                                              textAlign: TextAlign.right,
                                              style: AppConstants.arTextStyle,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              "${hadith.narrator} থেকে বর্ণিত:",
                                              style: const TextStyle(
                                                  color:
                                                      AppConstants.primaryColor,
                                                  fontSize: 17),
                                            ),
                                            const SizedBox(height: 6),
                                            Text(
                                              '${hadith.bn}',
                                              style: AppConstants.bnTextStyle,
                                              textAlign: TextAlign.justify,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
            );
          }),
        ),
      ),
    );
  }
}
