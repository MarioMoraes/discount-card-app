part of 'distance_state.dart';

class DistanceController extends Cubit<DistanceState> {
  DistanceController() : super(DistanceStateInitial());

  var value = 0.0;

  Future<void> setDistance(double value) async {
    emit(DistanceStateLoading());

    value = value;

    emit(DistanceStateLoaded(value: value));
  }
}
