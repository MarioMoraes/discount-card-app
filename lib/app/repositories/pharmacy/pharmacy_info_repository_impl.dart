// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:discount_card_app/app/core/rest/custom_dio.dart';
import 'package:discount_card_app/app/exceptions/repository_exception.dart';
import 'package:discount_card_app/app/models/pharmacy_info_model.dart';

import './pharmacy_info_repository.dart';

class PharmacyInfoRepositoryImpl implements PharmacyInfoRepository {
  final CustomDio dio;

  PharmacyInfoRepositoryImpl({
    required this.dio,
  });

  @override
  Future<PharmacyInfoModel?> getInfo(String nabp) async {
    try {
      final response = await dio.auth().get('/pharmacies/$nabp');

      if (response.statusCode == 200) {
        return PharmacyInfoModel.fromMap(response.data['data']);
      }
    } on DioError catch (e, s) {
      log('Error in Get Pharmacy Info', error: e, stackTrace: s);
      throw RepositoryException();
    }
    return null;
  }
}
