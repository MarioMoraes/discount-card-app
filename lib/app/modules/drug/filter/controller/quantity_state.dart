import 'package:bloc/bloc.dart';

part 'quantity_controller.dart';

class QuantityState {
  QuantityState();
}

class QuantityStateInitial extends QuantityState {}

class QuantityStateLoading extends QuantityState {}

class QuantityStateLoaded extends QuantityState {
  double quantity;

  QuantityStateLoaded({required this.quantity});

  List<Object> get props => [quantity];
}

class QuantityStateError extends QuantityState {}
