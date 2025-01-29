part of 'surah_cubit_cubit.dart';

@immutable
abstract class SurahCubitState {}

class SurahCubitInitial extends SurahCubitState {}

class SurahLoading extends SurahCubitState {}

class SurahSuccess extends SurahCubitState {}

class SurahError extends SurahCubitState {}

class ReciterLoading extends SurahCubitState {}

class ReciterSuccess extends SurahCubitState {}

class ReciterError extends SurahCubitState {}

class AudioForSurahLoading extends SurahCubitState {}

class AudioForSurahSuccess extends SurahCubitState {}

class AudioForSurahError extends SurahCubitState {}

class TextForSurahLoading extends SurahCubitState {}

class TextForSurahSuccess extends SurahCubitState {}

class TextForSurahError extends SurahCubitState {}
