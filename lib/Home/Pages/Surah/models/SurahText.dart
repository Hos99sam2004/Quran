class SurahText {
  SurahText({
    this.surahName,
    this.surahNameArabic,
    this.surahNameArabicLong,
    this.surahNameTranslation,
    this.revelationPlace,
    this.totalAyah,
    this.surahNo,
    this.audio,
    this.english,
    this.arabic1,
    this.arabic2,
    this.bengali,
  });

  SurahText.fromJson(dynamic json) {
    surahName = json['surahName'];
    surahNameArabic = json['surahNameArabic'];
    surahNameArabicLong = json['surahNameArabicLong'];
    surahNameTranslation = json['surahNameTranslation'];
    revelationPlace = json['revelationPlace'];
    totalAyah = json['totalAyah'];
    surahNo = json['surahNo'];
    audio = json['audio'] != null ? Audio.fromJson(json['audio']) : null;
    english = json['english'] != null ? json['english'].cast<String>() : [];
    arabic1 = json['arabic1'] != null ? json['arabic1'].cast<String>() : [];
    arabic2 = json['arabic2'] != null ? json['arabic2'].cast<String>() : [];
    bengali = json['bengali'] != null ? json['bengali'].cast<String>() : [];
  }
  String? surahName;
  String? surahNameArabic;
  String? surahNameArabicLong;
  String? surahNameTranslation;
  String? revelationPlace;
  int? totalAyah;
  int? surahNo;
  Audio? audio;
  List<String>? english;
  List<String>? arabic1;
  List<String>? arabic2;
  List<String>? bengali;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['surahName'] = surahName;
    map['surahNameArabic'] = surahNameArabic;
    map['surahNameArabicLong'] = surahNameArabicLong;
    map['surahNameTranslation'] = surahNameTranslation;
    map['revelationPlace'] = revelationPlace;
    map['totalAyah'] = totalAyah;
    map['surahNo'] = surahNo;
    if (audio != null) {
      map['audio'] = audio?.toJson();
    }
    map['english'] = english;
    map['arabic1'] = arabic1;
    map['arabic2'] = arabic2;
    map['bengali'] = bengali;
    return map;
  }
}

class Audio {
  Audio({
    this.a,
    this.b,
    this.c,
  });

  Audio.fromJson(dynamic json) {
    a = json['A'] != null ? A.fromJson(json['A']) : null;
    b = json['B'] != null ? B.fromJson(json['B']) : null;
    c = json['C'] != null ? C.fromJson(json['C']) : null;
  }
  A? a;
  B? b;
  C? c;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (a != null) {
      map['A'] = a?.toJson();
    }
    if (b != null) {
      map['B'] = b?.toJson();
    }
    if (c != null) {
      map['C'] = c?.toJson();
    }
    return map;
  }
}

class C {
  C({
    this.reciter,
    this.url,
    this.originalUrl,
  });

  C.fromJson(dynamic json) {
    reciter = json['reciter'];
    url = json['url'];
    originalUrl = json['originalUrl'];
  }
  String? reciter;
  String? url;
  String? originalUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reciter'] = reciter;
    map['url'] = url;
    map['originalUrl'] = originalUrl;
    return map;
  }
}

class B {
  B({
    this.reciter,
    this.url,
    this.originalUrl,
  });

  B.fromJson(dynamic json) {
    reciter = json['reciter'];
    url = json['url'];
    originalUrl = json['originalUrl'];
  }
  String? reciter;
  String? url;
  String? originalUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reciter'] = reciter;
    map['url'] = url;
    map['originalUrl'] = originalUrl;
    return map;
  }
}

class A {
  A({
    this.reciter,
    this.url,
    this.originalUrl,
  });

  A.fromJson(dynamic json) {
    reciter = json['reciter'];
    url = json['url'];
    originalUrl = json['originalUrl'];
  }
  String? reciter;
  String? url;
  String? originalUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reciter'] = reciter;
    map['url'] = url;
    map['originalUrl'] = originalUrl;
    return map;
  }
}
