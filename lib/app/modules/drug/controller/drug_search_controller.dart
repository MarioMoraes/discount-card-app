part of 'drug_search_state.dart';

class DrugSearchController extends Cubit<DrugSearchState> {
  final DrugsService drugsService;

  DrugSearchController({required this.drugsService})
      : super(DrugSearchStateInitial());

  Future<void> getDrugs(String drug) async {
    emit(DrugSearchStateLoading());

    try {
      final listDrugs = await drugsService.getDrugs(drug);

      if (listDrugs.isNotEmpty) {
        emit(DrugSearchStateLoaded(listDrugs: listDrugs));
      }
    } on Exception catch (e, s) {
      log('Erro ao Buscar Drugs', error: e, stackTrace: s);
      emit(DrugSearchStateError());
    }
  }
}
