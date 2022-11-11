// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:discount_card_app/app/models/pharmacy_info_model.dart';
import 'package:discount_card_app/app/repositories/pharmacy/pharmacy_info_repository.dart';

import 'pharmacy_info_service.dart';

class PharmacyInfoServiceImpl extends PharmacyInfoService {
  final PharmacyInfoRepository _repository;

  PharmacyInfoServiceImpl({
    required PharmacyInfoRepository repository,
  }) : _repository = repository;

  @override
  Future<PharmacyInfoModel?> getInfo(String nabp) => _repository.getInfo(nabp);
}
