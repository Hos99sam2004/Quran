class Surahmodel {
  Surahmodel({
    this.chapters,
  });

  Surahmodel.fromJson(dynamic json) {
    if (json['chapters'] != null) {
      chapters = [];
      json['chapters'].forEach((v) {
        chapters?.add(Chapters.fromJson(v));
      });
    }
  }
  List<Chapters>? chapters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (chapters != null) {
      map['chapters'] = chapters?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Chapters {
  Chapters({
    this.id,
    this.revelationPlace,
    this.revelationOrder,
    this.bismillahPre,
    this.nameSimple,
    this.nameComplex,
    this.nameArabic,
    this.versesCount,
    this.pages,
    this.translatedName,
  });

  Chapters.fromJson(dynamic json) {
    id = json['id'];
    revelationPlace = json['revelation_place'];
    revelationOrder = json['revelation_order'];
    bismillahPre = json['bismillah_pre'];
    nameSimple = json['name_simple'];
    nameComplex = json['name_complex'];
    nameArabic = json['name_arabic'];
    versesCount = json['verses_count'];
    pages = json['pages'] != null ? json['pages'].cast<int>() : [];
    translatedName = json['translated_name'] != null
        ? TranslatedName.fromJson(json['translated_name'])
        : null;
  }
  int? id;
  String? revelationPlace;
  int? revelationOrder;
  bool? bismillahPre;
  String? nameSimple;
  String? nameComplex;
  String? nameArabic;
  int? versesCount;
  List<int>? pages;
  TranslatedName? translatedName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['revelation_place'] = revelationPlace;
    map['revelation_order'] = revelationOrder;
    map['bismillah_pre'] = bismillahPre;
    map['name_simple'] = nameSimple;
    map['name_complex'] = nameComplex;
    map['name_arabic'] = nameArabic;
    map['verses_count'] = versesCount;
    map['pages'] = pages;
    if (translatedName != null) {
      map['translated_name'] = translatedName?.toJson();
    }
    return map;
  }
}

class TranslatedName {
  TranslatedName({
    this.languageName,
    this.name,
  });

  TranslatedName.fromJson(dynamic json) {
    languageName = json['language_name'];
    name = json['name'];
  }
  String? languageName;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['language_name'] = languageName;
    map['name'] = name;
    return map;
  }
}
