import 'package:bloc/bloc.dart';
import 'package:discount_card_app/app/services/auth/auth_service.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authService;

  LoginController({
    required AuthService authService,
  })  : _authService = authService,
        super(const LoginState.initial());

  Future<void> getAuth(String email, String password) async {
    emit(state.copyWith(status: LoginStatus.loading));

    try {
      await _authService.signIn(email, password);
      emit(state.copyWith(status: LoginStatus.completed));
    } on Exception {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }
}
