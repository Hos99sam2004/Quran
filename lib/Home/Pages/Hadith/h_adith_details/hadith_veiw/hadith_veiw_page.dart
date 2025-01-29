import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/Home/Pages/Hadith/cubit/hadith_cubit.dart';

class HadithVeiwPage extends StatelessWidget {
  bool type;
  HadithVeiwPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HadithCubit>();
    return BlocConsumer<HadithCubit, HadithState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (type == false)
          return Scaffold(
            appBar: AppBar(
              title: const Text('Hadith Veiw Page'),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset("assets/Vector.png"),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${cubit.random.data?.book}",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card.outlined(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${cubit.random.data?.bookName}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card.outlined(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${cubit.random.data?.header}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card.outlined(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${cubit.random.data?.refno}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card.outlined(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${cubit.random.data?.chapterName}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card.outlined(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${cubit.random.data?.hadithEnglish}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        else
          return Scaffold(
            appBar: AppBar(
              title: const Text('Hadith Veiw Page'),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset("assets/Vector.png"),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${cubit.Spacific.data?.book}",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card.outlined(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${cubit.Spacific.data?.bookName}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card.outlined(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${cubit.Spacific.data?.header}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card.outlined(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${cubit.Spacific.data?.refno}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card.outlined(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${cubit.Spacific.data?.chapterName}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card.outlined(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${cubit.Spacific.data?.hadithEnglish}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
      },
    );
  }
}
