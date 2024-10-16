part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  const CounterState();
  
  @override
  List<Object> get props => [];
}

final class CounterInitial extends CounterState {}

final class CounterLoading extends CounterState {}

final class CounterLoaded extends CounterState {}

final class CounterFailed extends CounterState {}
