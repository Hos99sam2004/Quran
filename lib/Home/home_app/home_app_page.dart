import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/Home/Pages/Hadith/Hadith.dart';
import 'package:quran_app/Home/Pages/Hizb.dart';
import 'package:quran_app/Home/Pages/Juz.dart';
import 'package:quran_app/Home/Pages/Surah/Surah%20Cubit/surah_cubit_cubit.dart';
import 'package:quran_app/Home/Pages/Surah/surah_details/Surah.dart';
import 'package:quran_app/Home/home_app/IconWidget/quran/quran_page.dart';
import 'package:quran_app/Shared/Shared_Components.dart';

class HomeAppPage extends StatefulWidget {
  const HomeAppPage({super.key});

  @override
  State<HomeAppPage> createState() => _HomeAppPageState();
}

class _HomeAppPageState extends State<HomeAppPage> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SurahCubitCubit>();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    print(
      "$h and $w",
    );
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            titleTextStyle: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: DarkPurple),
            title: Text(
              "Quran App",
            ),
            centerTitle: true,
            actions: <Widget>[
              Container(
                width: w * 0.3,
                height: h * 0.04,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 188, 244),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    Icon(Icons.search),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
          // drawer: Drawer(
          //   backgroundColor: IconColor,
          // ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  "السلام عليكم ورحمة الله و بركاته ",
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: DarkPurple),
                ),
                SizedBox(height: 5),
                Text(
                  "ALsalam Ealaykum \n Eng ::  Hossam Nasr ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: TextColor),
                ),
                SizedBox(height: 5),
                Container(
                    width: w * 0.8,
                    height: h * 0.14,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 247, 188, 244),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Row(children: [
                                Image.asset(
                                  "assets/book2.png",
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "...Last Read",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: DarkPurple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                              SizedBox(height: 15),
                              Text(
                                "${cubit.surahname.chapters?[0].nameArabic}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: DarkPurple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Ayah  Num - 1",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: DarkPurple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Image.asset("assets/Vector.png"),
                        ],
                      ),
                    )),
                // SizedBox(height: 5),
                TabBar(
                    isScrollable: true,
                    physics: BouncingScrollPhysics(),
                    dividerHeight: 3,
                    dividerColor: IconColor,
                    labelColor: DarkPurple,
                    unselectedLabelColor: TextColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelStyle: TextStyle(
                      fontSize: 18,
                    ),
                    automaticIndicatorColorAdjustment: true,
                    indicator: UnderlineTabIndicator(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: DarkPurple,
                        width: 5,
                      ),
                    ),
                    labelStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    indicatorAnimation: TabIndicatorAnimation.elastic,
                    tabs: [
                      Tab(
                        child: Text(
                          "Surah",
                        ),
                      ),
                      // Tab(
                      //   child: Text(
                      //     "Juz",
                      //   ),
                      // ),
                      Tab(
                        child: Text(
                          "Hadith",
                        ),
                      ),
                      // Tab(
                      //   child: Text(
                      //     "Hizb",
                      //   ),
                      // ),
                    ]),
                SizedBox(
                  height: h * 0.44,
                  child: TabBarView(children: [
                    Surah(),
                    // Juz(),
                    Hadith(),
                    // Hizb(),
                  ]),
                ),
                SizedBox(height: 4),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 247, 188, 244),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 247, 188, 244),
                                child: Image.asset("assets/vec.png"))),
                      ),
                      InkWell(
                        onTap: () async {
                          await goto(context, QuranPages());
                        },
                        child: Container(
                            width: 90,
                            height: 90,
                            // padding: EdgeInsets.all(10),

                            decoration: BoxDecoration(
                              color: DarkPurple,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: CircleAvatar(
                                backgroundColor: DarkPurple,
                                child: Image.asset("assets/Group 1.png"))),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 247, 188, 244),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 247, 188, 244),
                                child: Image.asset("assets/iconmosque.png"))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
