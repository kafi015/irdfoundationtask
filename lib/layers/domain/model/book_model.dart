class BookListModel {
  List<BookData>? data;

  BookListModel({this.data});

  BookListModel.fromJson(List<dynamic> json) {
    data = <BookData>[];
    for (var v in json) {
      data!.add(BookData.fromJson(v));
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

class BookData {
  int? id;
  String? title;
  String? titleAr;
  int? numberOfHadis;
  String? abvrCode;
  String? bookName;
  String? bookDescr;

  BookData(
      {this.id,
      this.title,
      this.titleAr,
      this.numberOfHadis,
      this.abvrCode,
      this.bookName,
      this.bookDescr});

  BookData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleAr = json['title_ar'];
    numberOfHadis = json['number_of_hadis'];
    abvrCode = json['abvr_code'];
    bookName = json['book_name'];
    bookDescr = json['book_descr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['title_ar'] = titleAr;
    data['number_of_hadis'] = numberOfHadis;
    data['abvr_code'] = abvrCode;
    data['book_name'] = bookName;
    data['book_descr'] = bookDescr;
    return data;
  }
}
