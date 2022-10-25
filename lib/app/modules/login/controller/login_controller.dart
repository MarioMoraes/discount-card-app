import 'package:bloc/bloc.dart';
import 'package:discount_card_app/app/services/auth/auth_service.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authService;

  LoginController({
    required AuthService authService,
  })  : _authService = authService,
        super(LoginStateInitial());

  Future<void> getAuth(String email, String password) async {
    emit(LoginStateLoading());
    final response = await _authService.signIn(email, password);
    emit(LoginStateLoaded(auth: response));
  }
}
