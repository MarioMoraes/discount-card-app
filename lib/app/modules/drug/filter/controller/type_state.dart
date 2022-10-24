import 'package:bloc/bloc.dart';
import 'package:discount_card_app/app/models/card_select_model.dart';

part 'type_controller.dart';

class TypeState {
  TypeState();
}

class TypeStateInitial extends TypeState {}

class TypeStateLoading extends TypeState {}

class TypeStateLoaded extends TypeState {
  List<CardSelectModel> list;

  TypeStateLoaded({required this.list});

  List<Object> get props => [list];
}

class TypeStateError extends TypeState {}
