import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/Home/Pages/Surah/models/AudioSurah.dart';
import 'package:quran_app/Home/Pages/Surah/models/Name_of_Reciters.dart';
import 'package:quran_app/Home/Pages/Surah/models/SurahText.dart';
import 'package:quran_app/Home/Pages/Surah/models/Surahmodel.dart';
// import 'package:quran_app/Home/Pages/Surah/models/surah_audio/audio_file.dart';
// import 'package:quran_app/Home/Pages/Surah/models/surah_audio/surah_audio.dart';
// import 'package:quran_app/Home/Pages/Surah/models/nameofreciter_model/nameofreciter_model.dart';
import 'package:quran_app/Shared/ApiConst.dart';
import 'package:quran_app/Shared/Helper.dart';
import 'package:quran_app/Shared/Shared_Components.dart';

part 'surah_cubit_state.dart';

class SurahCubitCubit extends Cubit<SurahCubitState> {
  SurahCubitCubit() : super(SurahCubitInitial());
  Surahmodel surahname = Surahmodel();
  void GetnameofSurah() async {
    emit(SurahLoading());
    try {
      final response =
          await ApiHelper.instance.GetData(url: Apiconst.NameOFSurah);
      surahname = Surahmodel.fromJson(response.data);
      if (response.statusCode == 200) {
        emit(SurahSuccess());
        // ShowToast(text: "ٍSuccess", state: ToastState.SUCCESS);
      } else {
        // ShowToast(text: "Error", state: ToastState.ERROR);
        emit(SurahError());
      }
    } catch (e) {
      print("$e");
      emit(SurahError());
    }
  }

  NameOfReciters nameofreciter = NameOfReciters();

  void GetnameofRecitation() async {
    emit(ReciterLoading());
    try {
      final response =
          await ApiHelper.instance.GetData(url: Apiconst.NameOFReciter);
      nameofreciter = NameOfReciters.fromJson(response.data);
      if (response.statusCode == 200) {
        // print(response.data);
        emit(ReciterSuccess());
        // ShowToast(text: "ٍSuccess", state: ToastState.SUCCESS);
      } else {
        ShowToast(text: "Error", state: ToastState.ERROR);
        emit(ReciterError());
      }
    } catch (e) {
      print("$e");
      emit(SurahError());
    }
  }

  AudioSurah audio = AudioSurah();
  Get_Audio_of_Surah_For_Reciter(
      {required dynamic reciterId, required dynamic chapterNumber}) async {
    emit(AudioForSurahLoading());
    try {
      final response = await ApiHelper.instance.GetData(
        url: "/chapter_recitations/$reciterId/$chapterNumber",
      );
      // print(response.data);
      audio = AudioSurah.fromJson(response.data);
      if (response.statusCode == 200) {
        // print(response.data);
        // print({audio.audioFile?.audioUrl});
        emit(AudioForSurahSuccess());
        ShowToast(text: "  ❤️‍🔥 Success", state: ToastState.SUCCESS);
      } else {
        ShowToast(text: " ❤️🔥 Error", state: ToastState.WARNING);
        emit(AudioForSurahError());
      }
    } catch (e) {
      print("$e");
      ShowToast(text: "$e", state: ToastState.ERROR);
      emit(AudioForSurahError());
    }
  }

  SurahText surahText = new SurahText();
  GetTextOFSurah({required int chapterNumber}) async {
    try {
      emit(TextForSurahSuccess());
      emit(TextForSurahLoading());
      final response = await ApiHelper.instance
          .GetData(url: "https://quranapi.pages.dev/api/$chapterNumber.json");
      surahText = SurahText.fromJson(response.data);
      if (response.statusCode == 200) {
        emit(TextForSurahSuccess());
        ShowToast(text: "  ❤️‍🔥 Success", state: ToastState.SUCCESS);
      } else {
        emit(TextForSurahError());
        ShowToast(text: "❤️‍🔥 Error", state: ToastState.WARNING);
      }
    } catch (e) {
      // TODO
      print(e);
      ShowToast(text: "$e", state: ToastState.ERROR);
      emit(TextForSurahError());
    }
  }
}
