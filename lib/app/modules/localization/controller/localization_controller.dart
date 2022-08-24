part of 'localization_state.dart';

class LocalizationController extends Cubit<LocalizationState> {
  LocalizationController()
      : super(LocalizationStateInitial(allow: true, notAllow: false));

  Future<void> setWidget() async {}
}
