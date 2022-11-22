import 'package:discount_card_app/app/models/pharmacy.dart';

abstract class PharmacyRepository {
  Future<List<Pharmacy>> getPharmacies();
}
