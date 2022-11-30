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

  var listComplete;
  var listCoverages;
  var listTypes;
  var listDosages;

  Future<void> getFilter(String nabp) async {
    try {
      emit(state.copyWith(status: SearchStatus.loading));
      listComplete = await service.getFilters(nabp);

      listCoverages = createCoverage([...listComplete]);
      listTypes = createType([...listComplete]);
      listDosages = createDosage([...listComplete]);

      emit(
        state.copyWith(
          status: SearchStatus.completed,
          listCoverages: listCoverages,
          listTypes: listTypes,
          listDosages: listDosages,
        ),
      );
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

    final coverage = listCoverages[0].description;

    final list = [...listComplete]
        .where((element) => element.coverage == coverage)
        .toList();

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

  List<CardSelectModel> createDosage(List<DrugsFilterModel> list) {
    List<CardSelectModel>? listCards = [];

    final dosage = listTypes[0].description;

    final list =
        [...listComplete].where((element) => element.type == dosage).toList();

    for (var i = 0; i < list.length; i++) {
      listCards.add(
        CardSelectModel(
          description: list[i].strength + ' ' + list[i].strengthUnit,
          selected: i == 0 ? true : false,
        ),
      );
    }
    return listCards;
  }

  changeCoverage(int index) {
    emit(state.copyWith(status: SearchStatus.loading, listCoverages: []));
    listCoverages.any((element) => element.selected = false);
    listCoverages[index].selected = true;

    listTypes = updateType(index);
    listDosages = updateDosage(0);

    emit(state.copyWith(
        listCoverages: listCoverages,
        listDosages: listDosages,
        listTypes: listTypes,
        status: SearchStatus.completed));
  }

  changeType(int index) {
    listDosages = updateDosage(index);

    emit(state.copyWith(status: SearchStatus.loading));
    listTypes.any((element) => element.selected = false);
    listTypes[index].selected = true;
    emit(state.copyWith(
        listTypes: listTypes,
        listDosages: listDosages,
        status: SearchStatus.completed));
  }

  void changeDosage(int index) {
    emit(state.copyWith(status: SearchStatus.loading, listDosages: []));
    listDosages.any((element) => element.selected = false);
    listDosages[index].selected = true;

    emit(state.copyWith(
        listCoverages: listCoverages,
        listDosages: listDosages,
        listTypes: listTypes,
        status: SearchStatus.completed));
  }

  List<CardSelectModel> updateType(int index) {
    List<CardSelectModel>? listTypes = [];

    final coverage = listCoverages[index].description;

    final list = [...listComplete]
        .where((element) => element.coverage == coverage)
        .toList();

    final items = list.map((element) => element.type).toSet().toList();

    for (var i = 0; i < items.length; i++) {
      listTypes.add(
        CardSelectModel(
          description: items[i],
          selected: i == 0 ? true : false,
        ),
      );
    }
    return listTypes;
  }

  List<CardSelectModel> updateDosage(int index) {
    List<CardSelectModel>? listCards = [];

    final dosage = listTypes[index].description;
    var coverage = '';

    for (var i = 0; i < listCoverages.length; i++) {
      if (listCoverages[i].selected) {
        coverage = listCoverages[i].description;
      }
    }

    final list = [...listComplete]
        .where(
            (element) => element.type == dosage && element.coverage == coverage)
        .toList();

    for (var i = 0; i < list.length; i++) {
      listCards.add(
        CardSelectModel(
          description: list[i].strength + ' ' + list[i].strengthUnit,
          selected: i == 0 ? true : false,
        ),
      );
    }

    return listCards;
  }

  void passParameters() {
    final coverage = listCoverages
        .where((element) => element.selected == true)
        .toSet()
        .toList()[0]
        .description;

    final type = listTypes
        .where((element) => element.selected == true)
        .toSet()
        .toList()[0]
        .description;

    final dosage = listDosages
        .where((element) => element.selected == true)
        .toSet()
        .toList()[0]
        .description;
  }
}
