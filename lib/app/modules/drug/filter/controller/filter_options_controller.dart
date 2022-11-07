// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:discount_card_app/app/models/drugs_filter_model.dart';
import 'package:discount_card_app/app/services/drugs/filter/filter_service.dart';
import 'package:equatable/equatable.dart';

part 'filter_options_state.dart';

class FilterOptionsController extends Cubit<FilterOptionsState> {
  final FilterService service;

  FilterOptionsController({
    required this.service,
  }) : super(FilterOptionsState.initial());

  Future<void> getFilter(String nabp) async {
    try {
      emit(state.copyWith(list: [], status: SearchStatus.loading));
      final listFilters = await service.getFilters(nabp);
      emit(state.copyWith(list: listFilters, status: SearchStatus.completed));
    } on Exception {
      emit(state.copyWith(list: [], status: SearchStatus.failure));
    }
  }
}
