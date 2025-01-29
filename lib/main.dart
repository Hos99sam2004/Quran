import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/Home/Pages/Hadith/cubit/hadith_cubit.dart';
import 'package:quran_app/Home/Pages/Surah/Surah%20Cubit/surah_cubit_cubit.dart';
// import 'package:quran_app/Shared/Shared_Components.dart';
import 'package:quran_app/splash_screen/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SurahCubitCubit()
            ..GetnameofSurah()
            ..GetnameofRecitation(),
        ),
        BlocProvider(create: (context) => HadithCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 245, 221, 250),
            elevation: 0,
            centerTitle: true,
          ),
          scaffoldBackgroundColor: Color.fromARGB(255, 245, 221, 250),
          // colorScheme:
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreenPage(),
      ),
    );
  }
}
