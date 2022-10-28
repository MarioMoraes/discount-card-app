import '../../models/pharmacy_and_prices_model.dart';

abstract class PharmacyAndPriceRepository {
  Future<List<PharmacyAndPrices>?> getPharmacies(
      String gpi14, String name, double lat, double long);
}
