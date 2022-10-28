part of 'login_controller.dart';

enum LoginStatus {
  initial,
  loading,
  completed,
  failure,
}

class LoginState extends Equatable {
  final LoginStatus status;

  const LoginState._({required this.status});

  const LoginState.initial() : this._(status: LoginStatus.initial);

  @override
  List<Object?> get props => [];

  LoginState copyWith({
    LoginStatus? status,
  }) {
    return LoginState._(
      status: status ?? this.status,
    );
  }
}
