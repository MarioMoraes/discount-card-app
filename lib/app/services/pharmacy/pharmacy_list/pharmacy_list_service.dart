import 'package:discount_card_app/app/models/pharmacy_location.dart';

abstract class PharmacyListService {
  Future<List<PharmacyLocation>> getPharmacies(
      double latitude, double longitude);
}
