import 'package:discount_card_app/app/models/drugs_filter_model.dart';

abstract class FilterRepository {
  Future<List<DrugsFilterModel>> getFilter(String nabp);
}
