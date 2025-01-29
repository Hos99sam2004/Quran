import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuranPages extends StatefulWidget {
  const QuranPages({Key? key}) : super(key: key);

  @override
  State<QuranPages> createState() => _QuranPagesState();
}

class _QuranPagesState extends State<QuranPages> {
  String formatNumber(int number) {
    return number.toString().padLeft(3, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("عرض صفحات القرآن")),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 603,
          itemBuilder: (context, index) {
            String pageNumber = formatNumber(index + 1);
            return Card(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: SvgPicture.network(
                  "https://www.mp3quran.net/api/quran_pages_svg/$pageNumber.svg",
                  fit: BoxFit.fill,
                  placeholderBuilder: (BuildContext context) =>
                      const CircularProgressIndicator(),
                  errorBuilder: (context, error, stackTrace) => Center(
                    child: Text(
                      "فشل تحميل الصورة${index + 1}",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
