import 'package:discount_card_app/app/repositories/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './auth_service.dart';

class AuthServiceImpl implements AuthService {
  final AuthRepository _authRepository;

  AuthServiceImpl({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> signIn(String email, String password) async {
    final token = await _authRepository.signIn(email, password);

    // Save Token In Local Storage
    //

    var sp = await SharedPreferences.getInstance();
    sp.setString('token', token);
  }
}
