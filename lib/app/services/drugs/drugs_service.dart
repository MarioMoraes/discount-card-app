import 'package:discount_card_app/app/models/drug_model.dart';

abstract class DrugsService {
  Future<List<DrugModel>> getDrugs(String drug);
}
