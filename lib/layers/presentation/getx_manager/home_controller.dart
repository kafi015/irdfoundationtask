import 'package:get/get.dart';
import '../../data/database/databasehelper.dart';
import '../../data/model/book_model.dart';

class HomeController extends GetxController {


  bool _getBookItemInProgress = false;
  BookListModel _bookListModel = BookListModel();

  bool get getBookItemInProgress => _getBookItemInProgress;
  BookListModel get bookListModel => _bookListModel;


  Future<bool> getBookList() async {
    _getBookItemInProgress = true;
    update();
    List<Map<String, dynamic>> bookList  = await DatabaseHelper.getDataFromDatabase();
    _getBookItemInProgress = false;

    if (bookList.isNotEmpty) {

      print('bookList');
      print(bookList);
      _bookListModel = BookListModel.fromJson(bookList);
      print('_bookListModel.data');
      print(_bookListModel.data);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }


  // bool _getSliderInProgress = false;
  //
  // HomeSliderModel _homeSliderModel = HomeSliderModel();
  //
  // bool get getSliderInProgress => _getSliderInProgress;
  // HomeSliderModel get getHomeSliderModel => _homeSliderModel;

  // Future<bool> getHomeSlider() async {
  //   _getSliderInProgress = true;
  //   update();
  //   final response = await NetworkCaller.getRequest(url: '/ListProductSlider');
  //   _getSliderInProgress = false;
  //   if (response.isSuccess) {
  //     _homeSliderModel = HomeSliderModel.fromJson(response.returnData);
  //     update();
  //     return true;
  //   } else {
  //     update();
  //     return false;
  //   }
  // }
}
