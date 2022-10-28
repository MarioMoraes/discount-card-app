part of 'drug_search_state.dart';

class DrugSearchController extends Cubit<DrugSearchState> {
  final DrugsService drugsService;

  DrugSearchController({required this.drugsService})
      : super(DrugSearchState.initial());

  Future<void> filter(String filter) async {
    emit(state.copyWith(listDrugs: [], status: SearchStatus.loading));

    try {
      final listDrugs = await drugsService.getDrugs(filter);

      if (listDrugs.isNotEmpty) {
        emit(state.copyWith(
            listDrugs: listDrugs, status: SearchStatus.completed));
      } else {
        emit(state.copyWith(listDrugs: [], status: SearchStatus.empty));
      }
    } on Exception catch (e, s) {
      log('Erro ao Buscar Drugs', error: e, stackTrace: s);
      emit(state.copyWith(status: SearchStatus.failure));
    }
  }
}
