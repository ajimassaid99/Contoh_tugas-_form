import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'datacontact1_event.dart';
part 'datacontact1_state.dart';

class Datacontact1Bloc extends Bloc<Datacontact1Event, Datacontact1State> {
  Datacontact1Bloc() : super(Datacontact1Initial()) {
    List data = [
                                {
                                  'name': 'John Doe',
                                  'number': '123-456-7890'
                                }
                              ];
     List<String> jsonDataList = data.map((item) {
    return json.encode(item);
  }).toList();
    on<getData>((event, emit) async {

      emit(Datacontact1Loading());
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList("counter", jsonDataList);
      List<String> counter = prefs.getStringList("counter") ?? [];
      emit(Datacontact1Success(counter: counter));

    });
  }
}
