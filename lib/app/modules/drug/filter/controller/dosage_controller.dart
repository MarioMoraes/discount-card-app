part of 'dosage_state.dart';

class DosageController extends Cubit<DosageState> {
  DosageController() : super(DosageStateInitial());

  var listCoverage = <CardSelectModel>[];

  Future<void> getDosage() async {
    emit(DosageStateLoading());

    // API Service
    listCoverage = [
      CardSelectModel(description: '100 ml', selected: true),
      CardSelectModel(description: '150 ml', selected: false),
      CardSelectModel(description: '250 ml', selected: false),
      CardSelectModel(description: '350 ml', selected: false),
    ];

    emit(DosageStateLoaded(list: listCoverage));
  }

  changeType(int index) {
    listCoverage.any((element) => element.selected = false);
    listCoverage[index].selected = true;
    emit(DosageStateLoaded(list: listCoverage));
  }
}
