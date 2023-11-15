part of 'imbd_bloc.dart';

@immutable
abstract class ImbdState {}

class ImbdInitial extends ImbdState {}
class ImbdblocLoading extends ImbdState {}
class ImbdblocLoaded extends ImbdState {}
class ImbdblocError extends ImbdState {}