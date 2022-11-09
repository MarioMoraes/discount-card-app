// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bloc/bloc.dart';
import 'package:discount_card_app/app/models/card_select_model.dart';
import 'package:discount_card_app/app/models/drugs_filter_model.dart';
import 'package:discount_card_app/app/services/drugs/filter/filter_service.dart';
import 'package:equatable/equatable.dart';

part 'filter_options_state.dart';

class FilterOptionsController extends Cubit<FilterOptionsState> {
  final FilterService service;

  FilterOptionsController({
    required this.service,
  }) : super(FilterOptionsState.initial());

  var listCoverages;
  var listTypes;

  Future<void> getFilter(String nabp) async {
    try {
      emit(state.copyWith(status: SearchStatus.loading));
      final list = await service.getFilters(nabp);

      listCoverages = createCoverage(list);
      listTypes = createType(list);

      emit(state.copyWith(
          status: SearchStatus.completed,
          listCoverages: listCoverages,
          listTypes: listTypes));
    } on Exception {
      emit(state.copyWith(status: SearchStatus.failure));
    }
  }

  List<CardSelectModel> createCoverage(List<DrugsFilterModel> list) {
    List<CardSelectModel>? listCards = [];

    final items = list.map((element) => element.coverage).toSet().toList();

    for (var i = 0; i < items.length; i++) {
      listCards.add(
        CardSelectModel(
          description: items[i],
          selected: i == 0 ? true : false,
        ),
      );
    }
    return listCards;
  }

  List<CardSelectModel> createType(List<DrugsFilterModel> list) {
    List<CardSelectModel>? listCards = [];

    final items = list.map((element) => element.type).toSet().toList();

    for (var i = 0; i < items.length; i++) {
      listCards.add(
        CardSelectModel(
          description: items[i],
          selected: i == 0 ? true : false,
        ),
      );
    }
    return listCards;
  }

  changeType(int index) {
    listCoverages.any((element) => element.selected = false);
    listCoverages[index].selected = true;
    emit(state.copyWith(
        listCoverages: listCoverages, status: SearchStatus.completed));
  }
}
