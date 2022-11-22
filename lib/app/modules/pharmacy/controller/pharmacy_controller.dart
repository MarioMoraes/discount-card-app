part of 'pharmacy_state.dart';

class PharmacyController extends Cubit<PharmacyState> {
  final PharmacyListService service;

  PharmacyController({required this.service}) : super(PharmacyState.initial());

  Future<void> getAllPharmacies() async {
    try {
      emit(state.copyWith(status: SearchStatus.loading, listPharmacies: []));
      final listPharmacies = await service.getPharmacies();
      emit(state.copyWith(
          status: SearchStatus.completed, listPharmacies: listPharmacies));
    } on Exception {
      emit(state.copyWith(status: SearchStatus.failure, listPharmacies: []));
    }
  }
}
