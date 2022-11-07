import 'package:discount_card_app/app/models/drugs_filter_model.dart';
import 'package:discount_card_app/app/repositories/auth/filter/filter_repository.dart';

import './filter_service.dart';

class FilterServiceImpl implements FilterService {
  FilterRepository filterRepository;

  FilterServiceImpl({
    required this.filterRepository,
  });

  @override
  Future<List<DrugsFilterModel>> getFilters(String nabp) =>
      filterRepository.getFilter(nabp);
}
