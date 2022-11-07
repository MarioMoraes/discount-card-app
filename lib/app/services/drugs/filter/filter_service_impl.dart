import 'package:discount_card_app/app/repositories/auth/filter/filter_repository.dart';

import './filter_service.dart';

class FilterServiceImpl implements FilterService {
  FilterRepository filterRepository;

  FilterServiceImpl({
    required this.filterRepository,
  });

  @override
  Future<void> getFilters(String nabp) async {
    final list = await filterRepository.getFilter(nabp);

    print(list);

    final coverage = list.first;

    final coverageList =
        list.where((element) => element.coverage == coverage.coverage);

    final type = coverageList.every(
      (e) => e.coverage == coverage.coverage,
    );

    print(type);

    //final dosage = type.where((element) => true);

    print('a');
  }
}
