part of 'text_bloc.dart';

@immutable
abstract class TextEvent {

}

class ChangeText extends TextEvent{
  final String finalText;
  final String midText;

  ChangeText(this.finalText, this.midText);
  
}
