import 'package:discount_card_app/app/models/pharmacy_info_model.dart';

abstract class PharmacyInfoService {
  Future<PharmacyInfoModel?> getInfo(String nabp);
}
