part of 'type_state.dart';

class TypeController extends Cubit<TypeState> {
  TypeController() : super(TypeStateInitial());

  var listType = <CardSelectModel>[];

  Future<void> getTypes() async {
    emit(TypeStateLoading());

    // API Service
    listType = [
      CardSelectModel(description: 'TABS', selected: true),
      CardSelectModel(description: 'SOLN', selected: false),
      CardSelectModel(description: 'TBDP', selected: false),
      CardSelectModel(description: 'OTHER', selected: false),
    ];

    emit(TypeStateLoaded(list: listType));
  }

  changeType(int index) {
    listType.any((element) => element.selected = false);
    listType[index].selected = true;
    emit(TypeStateLoaded(list: listType));
  }
}
