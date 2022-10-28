part of 'pharmacy_detail_state.dart';

class PharmacyDetailController extends Cubit<PharmacyDetailState> {
  final PharmacyAndPriceService _service;

  PharmacyDetailController({required PharmacyAndPriceService service})
      : _service = service,
        super(PharmacyDetailState.initial());

  Future<void> getPharmaciesAndPrices(
      {required String gpi14,
      required String name,
      required double lat,
      required double long}) async {
    try {
      emit(state.copyWith(listPharmacies: [], status: SearchStatus.loading));

      /// Call API
      final listPharmacies =
          await _service.getPharmacies(gpi14, name, lat, long);

      emit(state.copyWith(
          listPharmacies: listPharmacies, status: SearchStatus.completed));
    } on Exception {
      emit(state.copyWith(status: SearchStatus.failure));
    }
  }
}
