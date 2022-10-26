import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:discount_card_app/app/core/rest/custom_dio.dart';
import 'package:discount_card_app/app/exceptions/repository_exception.dart';
import 'package:discount_card_app/app/models/drug_model.dart';
import 'package:discount_card_app/app/repositories/drugs/drugs_repository.dart';

class DrugsRepositoryImpl extends DrugsRepository {
  final CustomDio dio;

  DrugsRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<DrugModel>> getDrugs(String drug) async {
    try {
      final response = await dio.auth().get(
        '/drugs',
        queryParameters: {
          'name': drug,
        },
      );

      if (response.statusCode == 200) {
        return response.data['data']
            .map<DrugModel>((e) => DrugModel.fromMap(e))
            .toList();
      }
    } on DioError catch (e, s) {
      log('Error Ao Buscar Drugs', error: e, stackTrace: s);
      throw RepositoryException();
    }
    return [];
  }
}
