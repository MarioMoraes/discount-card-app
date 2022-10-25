part of 'quantity_state.dart';

class QuantityController extends Cubit<QuantityState> {
  QuantityController() : super(QuantityStateInitial());

  var quantity = 0;

  Future<void> setQuantity(double quantity) async {
    emit(QuantityStateLoading());
    emit(QuantityStateLoaded(quantity: quantity));
  }
}
