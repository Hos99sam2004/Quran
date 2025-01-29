import 'data.hadith.dart';

class Randm {
  Data? data;

  Randm({this.data});

  factory Randm.fromHadith(Map<String, dynamic> json) => Randm(
        data: json['data'] == null
            ? null
            : Data.fromHadith(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toHadith() => {
        'data': data?.toHadith(),
      };
}
