part of 'pharmacy_list_state.dart';

class PharmacyListController extends Cubit<PharmacyListState> {
  final PharmacyAndPriceService _service;

  PharmacyListController({required PharmacyAndPriceService service})
      : _service = service,
        super(PharmacyListState.initial());

  Future<void> getPharmaciesAndPrices({
    required String gpi14,
    required String name,
    required double lat,
    required double long,
    int? distance,
    int? quantity,
    String? type,
    String? strength,
    String? coverage,
  }) async {
    try {
      emit(state.copyWith(listPharmacies: [], status: SearchStatus.loading));

      final listPharmacies = await _service.getPharmacies(
        gpi14,
        name,
        lat,
        long,
        distance,
        quantity,
        type,
        strength,
        coverage,
      );

      emit(state.copyWith(
          listPharmacies: listPharmacies, status: SearchStatus.completed));
    } on Exception {
      emit(state.copyWith(status: SearchStatus.failure));
    }
  }
}
