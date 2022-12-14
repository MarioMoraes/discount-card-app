import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:discount_card_app/app/core/rest/custom_dio.dart';
import 'package:discount_card_app/app/exceptions/repository_exception.dart';

import '../../../models/pharmacy_location.dart';
import 'pharmacy_repository.dart';

class PharmacyRepositoryImpl implements PharmacyRepository {
  final CustomDio _dio;

  PharmacyRepositoryImpl({
    required CustomDio dio,
  }) : _dio = dio;

  @override
  Future<List<PharmacyLocation>> getPharmacies(
      double latitude, double longitude) async {
    try {
      final response = await _dio.auth().get('/pharmacies', queryParameters: {
        'latitude': latitude,
        'longitude': longitude,
      });

      if (response.statusCode == 200) {
        return response.data['data']
            .map<PharmacyLocation>((e) => PharmacyLocation.fromMap(e))
            .toList();
      }
    } on DioError catch (e, s) {
      log('Error in List Pharmacies', error: e, stackTrace: s);
      throw RepositoryException();
    }
    return [];
  }
}
