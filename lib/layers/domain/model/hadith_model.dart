
class HadithListModel {

  List<HadithData>? data;

  HadithListModel({this.data});

  HadithListModel.fromJson(List<dynamic> json) {

    data = <HadithData>[];
    for (var v in json) {
      data!.add(HadithData.fromJson(v));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class HadithData {
  int? hadithId;
  int? bookId;
  String? bookName;
  int? chapterId;
  int? sectionId;
  String? narrator;
  String? bn;
  String? ar;
  String? arDiacless;
  String? note;
  int? gradeId;
  String? grade;
  String? gradeColor;

  HadithData(
      {this.hadithId,
        this.bookId,
        this.bookName,
        this.chapterId,
        this.sectionId,
        this.narrator,
        this.bn,
        this.ar,
        this.arDiacless,
        this.note,
        this.gradeId,
        this.grade,
        this.gradeColor});

  HadithData.fromJson(Map<String, dynamic> json) {
    hadithId = json['hadith_id'];
    bookId = json['book_id'];
    bookName = json['book_name'];
    chapterId = json['chapter_id'];
    sectionId = json['section_id'];
    narrator = json['narrator'];
    bn = json['bn'];
    ar = json['ar'];
    arDiacless = json['ar_diacless'];
    note = json['note'];
    gradeId = json['grade_id'];
    grade = json['grade'];
    gradeColor = json['grade_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hadith_id'] = hadithId;
    data['book_id'] = bookId;
    data['book_name'] = bookName;
    data['chapter_id'] = chapterId;
    data['section_id'] = sectionId;
    data['narrator'] = narrator;
    data['bn'] = bn;
    data['ar'] = ar;
    data['ar_diacless'] = arDiacless;
    data['note'] = note;
    data['grade_id'] = gradeId;
    data['grade'] = grade;
    data['grade_color'] = gradeColor;
    return data;
  }
}
