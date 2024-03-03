part of 'text_bloc.dart';

@immutable
abstract class TextState {}

class TextInitial extends TextState {}
class TextLoading extends TextState {}
class TextFailed extends TextState {}
class TextSucces extends TextState {
  final String data;
  TextSucces(this.data);
}
