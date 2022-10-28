import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:discount_card_app/app/models/drug_model.dart';
import 'package:discount_card_app/app/services/drugs/drugs_service.dart';
import 'package:equatable/equatable.dart';

part 'drug_search_controller.dart';

enum SearchStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class DrugSearchState extends Equatable {
  final List<DrugModel> listDrugs;
  final SearchStatus status;

  const DrugSearchState._({
    required this.listDrugs,
    required this.status,
  });

  DrugSearchState.initial()
      : this._(
          listDrugs: [],
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props => [listDrugs, status];

  DrugSearchState copyWith({
    List<DrugModel>? listDrugs,
    SearchStatus? status,
  }) {
    return DrugSearchState._(
      listDrugs: listDrugs ?? this.listDrugs,
      status: status ?? this.status,
    );
  }
}
