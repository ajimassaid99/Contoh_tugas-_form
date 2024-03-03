import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'text_event.dart';
part 'text_state.dart';

class TextBloc extends Bloc<TextEvent, TextState> {
  TextBloc() : super(TextInitial()) {
    on<ChangeText>((event, emit) async{
      emit(TextLoading());
      await Future.delayed(Duration(seconds: 2));
      emit(TextSucces(event.finalText));
    });
  }
}
