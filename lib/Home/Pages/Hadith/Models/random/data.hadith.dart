class Data {
  String? book;
  String? bookName;
  String? chapterName;
  String? hadithEnglish;
  String? header;
  int? id;
  String? refno;

  Data({
    this.book,
    this.bookName,
    this.chapterName,
    this.hadithEnglish,
    this.header,
    this.id,
    this.refno,
  });

  factory Data.fromHadith(Map<String, dynamic> json) => Data(
        book: json['book'] as String?,
        bookName: json['bookName'] as String?,
        chapterName: json['chapterName'] as String?,
        hadithEnglish: json['hadith_english'] as String?,
        header: json['header'] as String?,
        id: json['id'] as int?,
        refno: json['refno'] as String?,
      );

  Map<String, dynamic> toHadith() => {
        'book': book,
        'bookName': bookName,
        'chapterName': chapterName,
        'hadith_english': hadithEnglish,
        'header': header,
        'id': id,
        'refno': refno,
      };
}
