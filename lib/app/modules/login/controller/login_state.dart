part of 'login_controller.dart';

class LoginState {
  LoginState();
}

class LoginStateInitial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateLoaded extends LoginState {
  bool auth = false;

  LoginStateLoaded({required this.auth});

  List<Object> get props => [auth];
}

class LoginStateError extends LoginState {}
