import 'package:discount_card_app/app/models/drug_model.dart';

abstract class DrugsRepository {
  Future<List<DrugModel>> getDrugs(String drug);
}
