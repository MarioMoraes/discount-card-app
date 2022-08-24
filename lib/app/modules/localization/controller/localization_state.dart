import 'package:bloc/bloc.dart';

part 'localization_controller.dart';

class LocalizationState {
  const LocalizationState();
}

class LocalizationStateInitial extends LocalizationState {
  var allow = false;
  var notAllow = false;

  LocalizationStateInitial({required this.allow, required this.notAllow});

  List<Object> get props => [allow, notAllow];
}

class LocalizationStateOptions extends LocalizationState {
  var allow = false;
  var notAllow = false;

  LocalizationStateOptions({required this.allow, required this.notAllow});

  List<Object> get props => [allow, notAllow];
}

class LocalizationStateAllowed extends LocalizationState {}

class LocalizationStateNotAllowed extends LocalizationState {}
