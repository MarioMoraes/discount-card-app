import 'package:discount_card_app/app/models/pharmacy_and_prices_model.dart';
import 'package:discount_card_app/app/repositories/prices/pharmacy_and_price_repository.dart';
import 'package:discount_card_app/app/services/prices/pharmacy_and_price_service.dart';

class PharmacyAndPriceServiceImpl extends PharmacyAndPriceService {
  final PharmacyAndPriceRepository _repository;

  PharmacyAndPriceServiceImpl({
    required PharmacyAndPriceRepository repository,
  }) : _repository = repository;

  @override
  Future<List<PharmacyAndPricesModel>?> getPharmacies(
          String gpi14, String name, double lat, double long) =>
      _repository.getPharmacies(gpi14, name, lat, long);
}
