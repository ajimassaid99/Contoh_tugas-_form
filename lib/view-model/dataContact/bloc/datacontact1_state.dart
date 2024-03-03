part of 'datacontact1_bloc.dart';

abstract class Datacontact1State extends Equatable {
  const Datacontact1State();
  
  @override
  List<Object> get props => [];
}

class Datacontact1Initial extends Datacontact1State {}
class Datacontact1Success extends Datacontact1State {
  final List<String> counter;
  Datacontact1Success({required this.counter});
}
class Datacontact1Loading extends Datacontact1State {}
class Datacontact1Failed extends Datacontact1State {}
