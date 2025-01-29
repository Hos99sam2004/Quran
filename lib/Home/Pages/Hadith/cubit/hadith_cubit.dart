import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/Home/Pages/Hadith/Models/random/random.hadith.dart';
import 'package:quran_app/Shared/Helper.dart';

part 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  HadithCubit() : super(HadithInitial());
  Randm random = new Randm();
  Future<void> getRandomHadith({
    dynamic SelectedBook,
  }) async {
    emit(HadithLoading());
    try {
      final respose = await ApiHelper.instance.GetData(
          url: 'https://random-hadith-generator.vercel.app/$SelectedBook');
      random = Randm.fromHadith(respose.data);
      print(respose.data);
      if (respose.statusCode == 200)
        emit(HadithSuccess());
      else
        emit(HadithError());
    } catch (e) {
      emit(HadithError());
      print('Error: $e');
    }
  }

  Randm Spacific = new Randm();
  Future<void> getSpacificHadith({
    dynamic SelectedBook,
    required int selectedHadith,
  }) async {
    emit(HadithLoadings());
    try {
      final respose = await ApiHelper.instance.GetData(
          url:
              'https://random-hadith-generator.vercel.app/$SelectedBook/$selectedHadith');
      Spacific = Randm.fromHadith(respose.data);
      print(respose.data);
      if (respose.statusCode == 200)
        emit(HadithSuccesss());
      else
        emit(HadithErrors());
    } catch (e) {
      emit(HadithErrors());
      print('Error: $e');
    }
  }
}
