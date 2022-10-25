import 'package:bloc/bloc.dart';
import 'package:discount_card_app/app/models/card_select_model.dart';

part 'dosage_controller.dart';

class DosageState {
  DosageState();
}

class DosageStateInitial extends DosageState {}

class DosageStateLoading extends DosageState {}

class DosageStateLoaded extends DosageState {
  List<CardSelectModel> list;

  DosageStateLoaded({required this.list});

  List<Object> get props => [list];
}

class DosageStateError extends DosageState {}
