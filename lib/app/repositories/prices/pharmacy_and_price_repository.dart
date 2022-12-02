import '../../models/pharmacy_and_prices_model.dart';

abstract class PharmacyAndPriceRepository {
  Future<List<PharmacyAndPricesModel>?> getPharmacies(
    String gpi14,
    String name,
    double lat,
    double long,
    int? distance,
    int? quantity,
    String? type,
    String? strength,
    String? strengthUnit,
    String? coverage,
  );
}
