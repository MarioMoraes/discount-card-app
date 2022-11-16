import 'package:bloc/bloc.dart';
import 'package:discount_card_app/app/models/pharmacy_and_prices_model.dart';
import 'package:discount_card_app/app/services/prices/pharmacy_and_price_service.dart';
import 'package:equatable/equatable.dart';

part 'pharmacy_list_controller.dart';

enum SearchStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class PharmacyListState extends Equatable {
  final List<PharmacyAndPricesModel> listPharmacies;
  final SearchStatus status;

  const PharmacyListState._({
    required this.listPharmacies,
    required this.status,
  });

  PharmacyListState.initial()
      : this._(
          listPharmacies: [],
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props => [listPharmacies, status];

  PharmacyListState copyWith({
    List<PharmacyAndPricesModel>? listPharmacies,
    SearchStatus? status,
  }) {
    return PharmacyListState._(
      listPharmacies: listPharmacies ?? this.listPharmacies,
      status: status ?? this.status,
    );
  }
}
