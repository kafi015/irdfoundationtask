import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx_manager/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<HomeController>().getBookList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List'),
        centerTitle: true,
      ),

      body: GetBuilder<HomeController>(builder: (homeController) {

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
          print(homeController.bookListModel.data!.length);
          print(homeController.bookListModel.data?[0].bookName);
          return ListView.builder(
            itemCount: homeController.bookListModel.data!.length,
            itemBuilder: (context, index){
              return Card(
                child: ListTile(
                  leading: Text('${homeController.bookListModel.data?[index].id}'),
                  title: Text('${homeController.bookListModel.data?[index].title}'),
                  subtitle: const Text('ইমাম বুখারি'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${homeController.bookListModel.data?[index].numberOfHadis}'),
                      const Text('হাদিস'),
                    ],
                  ),

                ),
              );
            },
          );
        }
      }),
    );
  }
}
