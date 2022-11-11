part of 'pharmacy_detail_state.dart';

class PharmacyDetailController extends Cubit<PharmacyDetailState> {
  PharmacyInfoService service;

  PharmacyDetailController({required this.service})
      : super(const PharmacyDetailState.initial());

  Future<void> getInfo(String nabp) async {
    try {
      emit(state.copyWith(status: SearchStatus.loading));
      final pharmacy = await service.getInfo(nabp);
      emit(state.copyWith(status: SearchStatus.completed, pharmacy: pharmacy));
    } on Exception {
      emit(state.copyWith(status: SearchStatus.failure));
    }
  }
}
