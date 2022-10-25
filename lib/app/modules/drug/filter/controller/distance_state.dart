import 'package:bloc/bloc.dart';

part 'distance_controller.dart';

class DistanceState {
  DistanceState();
}

class DistanceStateInitial extends DistanceState {}

class DistanceStateLoading extends DistanceState {}

class DistanceStateLoaded extends DistanceState {
  double value = 0;

  DistanceStateLoaded({required this.value});

  List<Object> get props => [value];
}

class DistanceStateError extends DistanceState {}
