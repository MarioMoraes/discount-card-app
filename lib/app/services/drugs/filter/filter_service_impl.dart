import './filter_service.dart';
import '../../../models/drugs_filter_model.dart';
import '../../../repositories/drugs/filter/filter_repository.dart';

class FilterServiceImpl implements FilterService {
  FilterRepository filterRepository;

  FilterServiceImpl({
    required this.filterRepository,
  });

  @override
  Future<List<DrugsFilterModel>> getFilters(String nabp) async {
    final list = await filterRepository.getFilter(nabp);

    return list;

    /*
    final coverage = list.first;

    final coverageList =
        list.where((element) => element.coverage == coverage.coverage).toList();

    final lista2 = coverageList.map((element) => element.type).toSet().toList();

    final type = lista2[0];

    final typeList =
        list.where((element) => element.type == type).toSet().toList();

    for (var i = 0; i < typeList.length; i++) {
      print(typeList[i].strength + typeList[i].strengthUnit);
    }

    print(1);
   */
  }
}
