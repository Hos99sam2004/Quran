import 'package:flutter/material.dart';
import 'package:quran_app/Home/Pages/Hadith/h_adith_details/h_adith_details_page.dart';
import 'package:quran_app/Shared/Shared_Components.dart';

class Hadith extends StatelessWidget {
  Hadith({
    super.key,
  });

  Map<String, String> Name_of_book = {
    '  Bukhari': "bukhari",
    'Muslim': "muslim",
    'Ibn Majah': "ibnmajah",
    'Abu Dawud': "abudawud",
    'Al-Tirmidhi': "tirmidhi",
  };
  String book = "Bukhari";

  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 245, 221, 250),
      child: Center(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  book = Name_of_book.values.toList()[index];
                  print(book);
                  goto(
                      context,
                      HAdithDetailsPage(
                        book: book,
                      ));
                },
                child: Card(
                  child: ListTile(
                    title: Text(
                      Name_of_book.keys.toList()[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Button,
                      ),
                    ),
                    leading: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: DarkPurple,
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 2,
                ),
            itemCount: Name_of_book.length),
      ),
    );
  }
}
