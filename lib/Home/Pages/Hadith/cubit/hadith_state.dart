part of 'hadith_cubit.dart';

@immutable
abstract class HadithState {}

class HadithInitial extends HadithState {}

class HadithLoading extends HadithState {}

class HadithSuccess extends HadithState {}

class HadithError extends HadithState {}

class HadithLoadings extends HadithState {}

class HadithSuccesss extends HadithState {}

class HadithErrors extends HadithState {}
