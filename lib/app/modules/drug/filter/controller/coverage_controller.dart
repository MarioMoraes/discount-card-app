part of 'coverage_state.dart';

class CoverageController extends Cubit<CoverageState> {
  CoverageController() : super(CoverageState.initial());

  var listCoverage = <CardSelectModel>[];

  Future<void> getCoverage(List<String> list) async {
    emit(state.copyWith(list: [], status: SearchStatus.loading));
    emit(state.copyWith(list: listCoverage, status: SearchStatus.completed));
  }

  changeType(int index) {
    listCoverage.any((element) => element.selected = false);
    listCoverage[index].selected = true;
    emit(state.copyWith(list: listCoverage, status: SearchStatus.completed));
  }
}
