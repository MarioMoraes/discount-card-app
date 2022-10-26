part of 'drug_search_state.dart';

class DrugSearchController extends Cubit<DrugSearchState> {
  final DrugsService drugsService;

  DrugSearchController({required this.drugsService})
      : super(DrugSearchStateInitial());

  Future<List<DrugModel>> getDrugs(String drug) async {
    emit(DrugSearchStateLoading());

    try {
      final listDrugs = await drugsService.getDrugs(drug);

      if (listDrugs != []) {
        emit(DrugSearchStateLoaded(listDrugs: listDrugs));
      }
    } on Exception catch (e, s) {
      log('Erro ao Buscar Drugs', error: e, stackTrace: s);
      emit(DrugSearchStateError());
    }

    return [];
  }
}
