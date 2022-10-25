import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:discount_card_app/app/core/env/env.dart';
import 'package:discount_card_app/app/core/rest/custom_dio.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  AuthRepositoryImpl({
    required this.dio,
  });

  @override
  Future<bool> signIn(String email, String password) async {
    final baseUrl = Env.instance['base_url'] ?? '';

    try {
      final response = await dio.get(
        '$baseUrl/login',
        queryParameters: {
          'email': email,
          'password': password,
          'domain': Env.instance['domain'] ?? '',
        },
      );

      if (response.statusCode == 200) {
        return true;
      }
    } on DioError catch (e, s) {
      log('Error in Login', error: e, stackTrace: s);
      throw Exception();
    }
    return false;
  }
}
