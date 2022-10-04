import 'package:bloc/bloc.dart';
import 'package:discount_card_app/app/models/card_select_model.dart';

part 'coverage_controller.dart';

class CoverageState {
  CoverageState();
}

class CoverageStateInitial extends CoverageState {}

class CoverageStateLoading extends CoverageState {}

class CoverageStateLoaded extends CoverageState {
  List<CardSelectModel> list;

  CoverageStateLoaded({required this.list});

  List<Object> get props => [list];
}

class CoverageStateError extends CoverageState {}
