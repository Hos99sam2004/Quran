import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/Home/Pages/Surah/Surah%20Cubit/surah_cubit_cubit.dart';
// import 'package:quran_app/Home/Pages/Juz.dart';
import 'package:quran_app/Home/Pages/Surah/surah_details/surah_details_page.dart';
// import 'package:quran_app/Home/Pages/Surah/surah_details/surah_details_page.dart';
import 'package:quran_app/Shared/Shared_Components.dart';

class Surah extends StatelessWidget {
  const Surah({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SurahCubitCubit>();
    return BlocConsumer<SurahCubitCubit, SurahCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          color: Color.fromARGB(255, 245, 221, 250),
          child: Center(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      // GetSurahText();
                      await cubit.GetTextOFSurah(
                          chapterNumber:
                              cubit.surahname.chapters?[index].id ?? 1);
                      goto(
                          context,
                          SurahDetailsPage(
                            id: cubit.surahname.chapters![index].id,
                          ));
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          "${cubit.surahname.chapters?[index].nameArabic}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Button,
                          ),
                        ),
                        leading: Text(
                          "رقم ${cubit.surahname.chapters?[index].id}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: DarkPurple,
                          ),
                        ),
                        trailing: Text(
                          " ايه ${cubit.surahname.chapters?[index].versesCount}",
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
                itemCount: cubit.surahname.chapters?.length ?? 0),
          ),
        );
      },
    );
  }
}
