part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class Increment extends CounterEvent {
  final int angka;
  const Increment({required this.angka});

  @override
  List<Object> get props => [angka];
}
