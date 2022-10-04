part of 'coverage_state.dart';

class CoverageController extends Cubit<CoverageState> {
  CoverageController() : super(CoverageStateInitial());

  var listCoverage = <CardSelectModel>[];

  Future<void> getCoverage() async {
    emit(CoverageStateLoading());

    // API Service
    listCoverage = [
      CardSelectModel(description: 'BRAND', selected: true),
      CardSelectModel(description: 'GENERIC', selected: false),
    ];

    emit(CoverageStateLoaded(list: listCoverage));
  }

  changeType(int index) {
    listCoverage.any((element) => element.selected = false);
    listCoverage[index].selected = true;
    emit(CoverageStateLoaded(list: listCoverage));
  }
}
