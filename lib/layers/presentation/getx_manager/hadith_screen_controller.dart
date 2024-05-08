import 'package:get/get.dart';
import 'package:irdfoundationtask/layers/domain/model/hadith_model.dart';
import 'package:irdfoundationtask/layers/domain/model/section_model.dart';
import '../../data/database/databasehelper.dart';

class HadithScreenController extends GetxController {


  bool _getSectionItemInProgress = false;
  SectionListModel _sectionListModel = SectionListModel();

  bool get getSectionItemInProgress => _getSectionItemInProgress;
  SectionListModel get sectionListModel => _sectionListModel;

  bool _getHadithItemInProgress = false;
  HadithListModel _hadithListModel = HadithListModel();

  bool get getHadithItemInProgress => _getHadithItemInProgress;
  HadithListModel get hadithListModel => _hadithListModel;


  Future<bool> getSectionList() async {
    _getSectionItemInProgress = true;
    update();
    List<Map<String, dynamic>> sectionList  = await DatabaseHelper.getDataFromDatabase('section');
    _getSectionItemInProgress = false;

    //print(sectionList);

    if (sectionList.isNotEmpty) {
      _sectionListModel = SectionListModel.fromJson(sectionList);

      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getHadithList() async {
    _getHadithItemInProgress = true;
    update();
    List<Map<String, dynamic>> hadithList  = await DatabaseHelper.getDataFromDatabase('hadith');
    _getHadithItemInProgress = false;


   // log('$hadithList');


    if (hadithList.isNotEmpty) {
      _hadithListModel = HadithListModel.fromJson(hadithList);

      update();
      return true;
    } else {
      update();
      return false;
    }
  }


}
