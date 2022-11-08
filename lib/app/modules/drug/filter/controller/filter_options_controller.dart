// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:discount_card_app/app/models/drugs_filter_model.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/coverage_state.dart';
import 'package:discount_card_app/app/services/drugs/filter/filter_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'filter_options_state.dart';

class FilterOptionsController extends Cubit<FilterOptionsState> {
  final FilterService service;

  FilterOptionsController({
    required this.service,
  }) : super(FilterOptionsState.initial());

  Future<void> getFilter(String nabp) async {
    try {
      emit(state.copyWith(status: SearchStatus.loading));
      final list = await service.getFilters(nabp);
      emit(state.copyWith(status: SearchStatus.completed, list: list));
      mountWidgets(list);
    } on Exception {
      emit(state.copyWith(status: SearchStatus.failure));
    }
  }

  Future<void> mountWidgets(List<DrugsFilterModel> list) async {
    final coverageController = Modular.get<CoverageController>();

    // final coverage = list.first;
    // final coverageList =
    //    list.where((element) => element.coverage == coverage.coverage).toList();

    final coverageConverted =
        list.map((element) => element.coverage).toSet().toList();

    coverageController.getCoverage(coverageConverted);
  }
}
