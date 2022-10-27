import 'package:discount_card_app/app/models/drug_model.dart';
import 'package:discount_card_app/app/repositories/drugs/drugs_repository.dart';
import 'package:discount_card_app/app/services/drugs/drugs_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrugsServiceImpl extends DrugsService {
  final DrugsRepository _drugsRepository;

  DrugsServiceImpl({
    required DrugsRepository drugsRepository,
  }) : _drugsRepository = drugsRepository;

  @override
  Future<List<DrugModel>> getDrugs(String drug) async {
    // Save Search Text In Local Storage

    List<String>? searchSaved;
    var sp = await SharedPreferences.getInstance();
    searchSaved = sp.getStringList('recents');

    if (searchSaved != null) {
      searchSaved.add(drug.toUpperCase());
    } else {
      searchSaved = <String>[];
      searchSaved.add(drug.toUpperCase());
    }
    sp.setStringList('recents', searchSaved);

    return _drugsRepository.getDrugs(drug);
  }
}
