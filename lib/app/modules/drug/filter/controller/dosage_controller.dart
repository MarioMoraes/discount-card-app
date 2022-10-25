part of 'dosage_state.dart';

class DosageController extends Cubit<DosageState> {
  DosageController() : super(DosageStateInitial());

  var listDosage = <CardSelectModel>[];

  Future<void> getDosage() async {
    emit(DosageStateLoading());

    // API Service
    listDosage = [
      CardSelectModel(description: '100 ml', selected: true),
      CardSelectModel(description: '150 ml', selected: false),
      CardSelectModel(description: '250 ml', selected: false),
    ];

    emit(DosageStateLoaded(list: listDosage));
  }

  changeType(int index) {
    listDosage.any((element) => element.selected = false);
    listDosage[index].selected = true;
    emit(DosageStateLoaded(list: listDosage));
  }
}
