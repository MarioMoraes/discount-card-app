import 'package:discount_card_app/app/models/pharmacy_location.dart';
import 'package:discount_card_app/app/repositories/pharmacy/pharmacy_list/pharmacy_repository.dart';

import './pharmacy_list_service.dart';

class PharmacyListServiceImpl implements PharmacyListService {
  final PharmacyRepository _repository;

  PharmacyListServiceImpl({
    required PharmacyRepository repository,
  }) : _repository = repository;

  @override
  Future<List<PharmacyLocation>> getPharmacies(
          double latitude, double longitude) async =>
      _repository.getPharmacies(latitude, longitude);
}
