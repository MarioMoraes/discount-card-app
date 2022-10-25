import 'package:discount_card_app/app/repositories/auth/auth_repository.dart';

import './auth_service.dart';

class AuthServiceImpl implements AuthService {
  final AuthRepository _authRepository;

  AuthServiceImpl({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<bool> signIn(String email, String password) =>
      _authRepository.signIn(email, password);
}
