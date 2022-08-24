import 'package:bloc/bloc.dart';

part 'drug_search_controller.dart';

abstract class DrugSearchState {
  DrugSearchState();
}

class DrugSearchStateInitial extends DrugSearchState {}

class DrugSearchStateLoading extends DrugSearchState {}

class DrugSearchStateLoaded extends DrugSearchState {}

class DrugSearchStateError extends DrugSearchState {}
