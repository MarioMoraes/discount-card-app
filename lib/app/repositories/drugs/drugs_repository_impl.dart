import 'package:discount_card_app/app/models/drug_model.dart';
import 'package:discount_card_app/app/repositories/drugs/drugs_repository.dart';

class DrugsRepositoryImpl extends DrugsRepository {
  @override
  Future<List<DrugModel>> getDrugs(String drug) async {
    return [];
  }
}
