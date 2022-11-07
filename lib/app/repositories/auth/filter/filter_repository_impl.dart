import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:discount_card_app/app/core/rest/custom_dio.dart';
import 'package:discount_card_app/app/exceptions/repository_exception.dart';
import 'package:discount_card_app/app/models/drugs_filter_model.dart';
import 'package:discount_card_app/app/repositories/auth/filter/filter_repository.dart';

class FilterRepositoryImpl extends FilterRepository {
  final CustomDio _dio;

  FilterRepositoryImpl({
    required CustomDio dio,
  }) : _dio = dio;

  @override
  Future<List<DrugsFilterModel>> getFilter(String nabp) async {
    try {
      final response = await _dio.get('/drugs/$nabp/filters');

      if (response.statusCode == 200) {
        return response.data['data']
            .map<DrugsFilterModel>((e) => DrugsFilterModel.fromMap(e))
            .toList();
      }
    } on DioError {
      log('Error in Loading Filters');
      throw RepositoryException();
    }

    return [];
  }
}
