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

  Future<void> getFilter(String nabp) async {
    try {
      emit(state.copyWith(status: SearchStatus.loading));
      final list = await service.getFilters(nabp);

      final listCoverages = mountWidgets(list);

      emit(state.copyWith(
          status: SearchStatus.completed, listCoverages: listCoverages));
    } on Exception {
      emit(state.copyWith(status: SearchStatus.failure));
    }
  }

  List<CardSelectModel> mountWidgets(List<DrugsFilterModel> list) {
    List<CardSelectModel>? listCards = [];

    final items = list.map((element) => element.coverage).toSet().toList();

    for (var i = 0; i < items.length; i++) {
      print(i);
      listCards.add(
        CardSelectModel(
          description: items[i],
          selected: i == 0 ? true : false,
        ),
      );
    }
    return listCards;
  }
}
