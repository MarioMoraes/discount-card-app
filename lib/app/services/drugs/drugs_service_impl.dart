import 'package:discount_card_app/app/models/drug_model.dart';
import 'package:discount_card_app/app/repositories/drugs/drugs_repository.dart';
import 'package:discount_card_app/app/services/drugs/drugs_service.dart';

class DrugsServiceImpl extends DrugsService {
  final DrugsRepository _drugsRepository;

  DrugsServiceImpl({
    required DrugsRepository drugsRepository,
  }) : _drugsRepository = drugsRepository;

  @override
  Future<List<DrugModel>> getDrugs(String drug) =>
      _drugsRepository.getDrugs(drug);
}
