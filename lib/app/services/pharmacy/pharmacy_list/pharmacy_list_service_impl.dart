// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:discount_card_app/app/models/pharmacy.dart';
import 'package:discount_card_app/app/repositories/pharmacy/pharmacy_list/pharmacy_repository.dart';

import './pharmacy_list_service.dart';

class PharmacyListServiceImpl implements PharmacyListService {
  final PharmacyRepository _repository;

  PharmacyListServiceImpl({
    required PharmacyRepository repository,
  }) : _repository = repository;

  @override
  Future<List<Pharmacy>> getPharmacies() async => _repository.getPharmacies();
}
