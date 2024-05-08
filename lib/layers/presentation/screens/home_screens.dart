import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irdfoundationtask/layers/presentation/screens/chapter_screen.dart';
import 'package:irdfoundationtask/layers/presentation/utils/constants.dart';
import 'package:irdfoundationtask/layers/presentation/widgets/hexagon_painter.dart';

import '../getx_manager/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 350,
                child: AppBar(
                  backgroundColor: AppConstants.primaryColor,
                  leading: const Icon(
                    Icons.menu_sharp,
                    size: 25,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'আল হাদিস',
                    style: AppConstants.appBarTitle,
                  ),
                  centerTitle: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  bottom: const PreferredSize(
                    preferredSize: Size.fromHeight(250),
                    child: SizedBox(),
                  ),
                  actions: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search_sharp,
                        size: 25,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 270, left: 20, right: 20),
                child: Container(
                  padding: const EdgeInsets.only(top: 400),
                  height: 120,
                  width: 380,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
             const Padding(
               padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 140.0),
               child: Text(
                    'নবী করীম (সাল্লাল্লাহু \'আলায়হি ওয়া সাল্লাম) বলেছেন, "যে ব্যক্তি আমার ন্যায় এরূপ অযু করে একাগ্র চিত্তে দু\'রাকআত নামায পড়বে, '
                        'তার পূর্বের সকল গোনাহ মাফ করে দেওয়া হবে।” (বুখারী ১৫৯, মুসলিম ৫৩৯)"\n[১০০ সুসাব্যস্ত হাদিস]',
               style: TextStyle(color: Colors.white,),
                 textAlign: TextAlign.center,
               ),
             ),
              const Padding(
                padding: EdgeInsets.only(top: 290.0, left: 50, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.timelapse,
                          size: 40,
                          color: AppConstants.primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'সর্বশেষ',
                          style: AppConstants.cardTitle,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.menu_book,
                          size: 40,
                          color: AppConstants.primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'অ্যাপস',
                          style: AppConstants.cardTitle,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.next_plan,
                          size: 40,
                          color: AppConstants.primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'হাদিসে যান',
                          style: AppConstants.cardTitle,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.payments_outlined,
                          size: 40,
                          color: AppConstants.primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'সদকা',
                          style: AppConstants.cardTitle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'সব হাদিসের বই',
              style: AppConstants.cardTitle,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: GetBuilder<HomeController>(builder: (homeController) {
                if (homeController.getBookItemInProgress) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: homeController.bookListModel.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            Get.to(ChapterScreen(
                              title:
                                  '${homeController.bookListModel.data?[index].title}',
                              noOfHadith:
                                  '${homeController.bookListModel.data?[index].numberOfHadis}',
                              boolId:
                                  '${homeController.bookListModel.data?[index].id}',
                            ));
                          },
                          leading: Container(
                            margin: const EdgeInsets.all(8),
                            width: 35, // Adjust size as needed
                            height: 37, // Adjust size as needed
                            child: CustomPaint(
                              painter: HexagonPainter(
                                color: AppConstants.secondaryColor,
                                abvrCode:
                                    '${homeController.bookListModel.data?[index].abvrCode}',
                              ),
                            ),
                          ),
                          title: Text(
                            '${homeController.bookListModel.data?[index].title}',
                            style: AppConstants.cardTitle,
                          ),
                          subtitle: const Text('ইমাম বুখারি'),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  '${homeController.bookListModel.data?[index].numberOfHadis}'),
                              const Text('হাদিস'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
