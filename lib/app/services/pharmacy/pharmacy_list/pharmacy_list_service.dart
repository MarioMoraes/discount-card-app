import 'package:discount_card_app/app/models/pharmacy.dart';

abstract class PharmacyListService {
  Future<List<Pharmacy>> getPharmacies();
}
