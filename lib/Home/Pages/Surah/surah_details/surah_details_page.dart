import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/Home/Pages/Surah/Surah%20Cubit/surah_cubit_cubit.dart';
import 'package:quran_app/Home/Pages/Surah/surah_details/audio_of_surah/audio_of_surah_page.dart';
import 'package:quran_app/Shared/Shared_Components.dart';

class SurahDetailsPage extends StatefulWidget {
  int? id;
  SurahDetailsPage({
    super.key,
    required this.id,
  });

  @override
  State<SurahDetailsPage> createState() => _SurahDetailsPageState();
}

class _SurahDetailsPageState extends State<SurahDetailsPage> {
  int? SelectedReciter;

  Widget build(BuildContext context) {
    final cubit = context.read<SurahCubitCubit>();
    return BlocConsumer<SurahCubitCubit, SurahCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Reciters(cubit),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "عدد الايات ${cubit.surahText.totalAyah}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "  رقم  ${widget.id}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "${cubit.surahText.surahNameArabicLong}",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                Center(
                  child: Text(
                    "${cubit.surahText.surahName}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border(
                          left: BorderSide(
                            color: DarkPurple,
                            width: 10,
                          ),
                          top: BorderSide(
                            color: DarkPurple,
                            width: 10,
                          ),
                          right: BorderSide(
                            color: DarkPurple,
                            width: 10,
                          ),
                          bottom: BorderSide(
                            color: DarkPurple,
                            width: 10,
                          ),
                        )),
                    width: double.infinity,
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView(
                        // shrinkWrap: true,
                        children: cubit.surahText.arabic1!.map((item) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                item,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    fontSize: 25,
                                    // color: DarkPurple,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 10),
                            ],
                          );
                        }).toList(), // Convert Iterable to List
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: BlocBuilder<SurahCubitCubit, SurahCubitState>(
            builder: (context, state) {
              if (state is AudioForSurahLoading) {
                return CircularProgressIndicator();
              } else {
                return FloatingActionButton(
                  backgroundColor: DarkPurple,
                  onPressed: () async {
                    var selected = 1;
                    if (SelectedReciter == null) {
                      Random randomnumber = new Random();
                      selected = randomnumber.nextInt(114);
                    }
                    await cubit.Get_Audio_of_Surah_For_Reciter(
                        reciterId: SelectedReciter != null
                            ? SelectedReciter
                            : selected,
                        chapterNumber: widget.id);
                    String? url =
                        await cubit.audio.audioFile?.audioUrl.toString();
                    print(url);
                    goto(
                        context,
                        AudioOfSurahPage(
                          reciternumber: SelectedReciter ?? selected,
                          surahNumber: widget.id!,
                          // cubit: cubit,
                          audioUrl: url ??
                              "https://download.quranicaudio.com/qdc/abdul_baset/mujawwad/1.mp3",
                        ));
                  },
                  child: Icon(
                    Icons.keyboard_voice_outlined,
                    color: Colors.white,
                  ),
                );
              }
              // return Loading();
            },
          ),
        );
      },
    );
  }

  Container Reciters(SurahCubitCubit cubit) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: RadialGradient(
            colors: [
              IconColor,
              Button,
            ],
            tileMode: TileMode.mirror,
          )),
      child: DropdownButton(
        underline: SizedBox(),
        borderRadius: BorderRadius.circular(20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        icon: Icon(Icons.arrow_drop_down),
        isDense: true,
        iconEnabledColor: DarkPurple,
        iconSize: 40,
        hint: Text(
          "  اختر  القارئ ",
          style: TextStyle(
              color: DarkPurple, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        style: TextStyle(
            color: DarkPurple, fontWeight: FontWeight.bold, fontSize: 16.8),
        elevation: 8,
        items: List.generate(
          cubit.nameofreciter.recitations!.length ?? 0,
          (index) => DropdownMenuItem(
            alignment: Alignment.center,
            value: cubit.nameofreciter.recitations?[index].id,
            child:
                Text("${cubit.nameofreciter.recitations?[index].reciterName}"),
          ),
        ),
        onChanged: (val) {
          print(val);
          setState(() {
            SelectedReciter = val;
          });
          print(SelectedReciter);
        },
        value: SelectedReciter,
      ),
    );
  }
}
