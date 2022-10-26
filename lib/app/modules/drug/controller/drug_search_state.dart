import 'package:bloc/bloc.dart';
import 'package:discount_card_app/app/models/drug_model.dart';

part 'drug_search_controller.dart';

abstract class DrugSearchState {
  DrugSearchState();
}

class DrugSearchStateInitial extends DrugSearchState {}

class DrugSearchStateLoading extends DrugSearchState {}

class DrugSearchStateLoaded extends DrugSearchState {
  List<DrugModel> listDrugs;

  DrugSearchStateLoaded({required this.listDrugs});

  List<Object> get props => [listDrugs];
}

class DrugSearchStateError extends DrugSearchState {}
