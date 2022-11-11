import 'package:discount_card_app/app/models/pharmacy_info_model.dart';

abstract class PharmacyInfoRepository {
  Future<PharmacyInfoModel?> getInfo(String nabp);
}
