part of 'coverage_state.dart';

class CoverageController extends Cubit<CoverageState> {
  CoverageController() : super(CoverageState.initial());

  var listCoverage = <CardSelectModel>[];

  Future<void> getCoverage(List<String> list) async {
    emit(state.copyWith(list: [], status: SearchStatus.loading));

    for (var i = 0; i < list.length; i--) {
      listCoverage.add(
        CardSelectModel(
          description: list[i],
          selected: i == 0 ? true : false,
        ),
      );
    }

    print(listCoverage);
    emit(state.copyWith(list: listCoverage, status: SearchStatus.completed));
  }

  changeType(int index) {
    listCoverage.any((element) => element.selected = false);
    listCoverage[index].selected = true;
    emit(state.copyWith(list: listCoverage, status: SearchStatus.completed));
  }
}
