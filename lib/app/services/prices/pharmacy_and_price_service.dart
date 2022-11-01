import 'package:discount_card_app/app/models/pharmacy_and_prices_model.dart';

abstract class PharmacyAndPriceService {
  Future<List<PharmacyAndPricesModel>?> getPharmacies(
      String gpi14, String name, double lat, double long);
}
