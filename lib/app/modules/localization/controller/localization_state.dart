import 'package:bloc/bloc.dart';

part 'localization_controller.dart';

class LocalizationState {
  const LocalizationState();
}

class LocalizationStateInitial extends LocalizationState {}

class LocalizationStateAllowed extends LocalizationState {}

class LocalizationStateNotAllowed extends LocalizationState {}
