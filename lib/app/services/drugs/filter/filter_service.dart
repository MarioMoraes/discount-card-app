import 'package:discount_card_app/app/models/drugs_filter_model.dart';

abstract class FilterService {
  Future<List<DrugsFilterModel>> getFilters(String nabp);
}
