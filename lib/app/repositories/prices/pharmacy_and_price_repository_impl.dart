import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:discount_card_app/app/core/rest/custom_dio.dart';
import 'package:discount_card_app/app/models/pharmacy_and_prices_model.dart';

import '../../exceptions/repository_exception.dart';
import 'pharmacy_and_price_repository.dart';

class PharmacyAndPriceRepositoryImpl extends PharmacyAndPriceRepository {
  final CustomDio dio;

  PharmacyAndPriceRepositoryImpl({required this.dio});

  @override
  Future<List<PharmacyAndPricesModel>?> getPharmacies(
      String gpi14, String name, double lat, double long) async {
    try {
      final response = await dio.auth().get('/drugs/$gpi14/pharmacies/prices',
          queryParameters: {'name': name, 'latitude': lat, 'longitude': long});

      if (response.statusCode == 200) {
        return response.data['data']
            .map<PharmacyAndPricesModel>(
                (e) => PharmacyAndPricesModel.fromMap(e))
            .toList();
      }
    } on DioError catch (e, s) {
      log('Error In Pharmacy And Prices API', error: e, stackTrace: s);
      throw RepositoryException();
    }
    return null;
  }
}
