class SectionListModel {
  List<SectionData>? data;

  SectionListModel({this.data});

  SectionListModel.fromJson(List<dynamic> json) {
    data = <SectionData>[];
    for (var v in json) {
      data!.add(SectionData.fromJson(v));
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

class SectionData {
  int? id;
  int? bookId;
  String? bookName;
  int? chapterId;
  int? sectionId;
  String? title;
  String? preface;
  String? number;

  SectionData(
      {this.id,
      this.bookId,
      this.bookName,
      this.chapterId,
      this.sectionId,
      this.title,
      this.preface,
      this.number});

  SectionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['book_id'];
    bookName = json['book_name'];
    chapterId = json['chapter_id'];
    sectionId = json['section_id'];
    title = json['title'];
    preface = json['preface'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['book_id'] = bookId;
    data['book_name'] = bookName;
    data['chapter_id'] = chapterId;
    data['section_id'] = sectionId;
    data['title'] = title;
    data['preface'] = preface;
    data['number'] = number;
    return data;
  }
}
