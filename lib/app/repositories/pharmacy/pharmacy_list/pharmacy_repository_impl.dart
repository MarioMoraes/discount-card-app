// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:discount_card_app/app/core/rest/custom_dio.dart';
import 'package:discount_card_app/app/exceptions/repository_exception.dart';
import 'package:discount_card_app/app/models/pharmacy.dart';

import 'pharmacy_repository.dart';

class PharmacyRepositoryImpl implements PharmacyRepository {
  final CustomDio _dio;

  PharmacyRepositoryImpl({
    required CustomDio dio,
  }) : _dio = dio;

  @override
  Future<List<Pharmacy>> getPharmacies() async {
    try {
      final response = await _dio.auth().get('/pharmacies');

      if (response.statusCode == 200) {
        return response.data['data'].map((e) => Pharmacy.fromMap(e)).toList();
      }
    } on DioError catch (e, s) {
      log('Error in List Pharmacies', error: e, stackTrace: s);
      throw RepositoryException();
    }
    return [];
  }
}
