import 'package:bloc/bloc.dart';
import 'package:discount_card_app/app/models/pharmacy_and_prices_model.dart';
import 'package:discount_card_app/app/services/prices/pharmacy_and_price_service.dart';
import 'package:equatable/equatable.dart';

part 'pharmacy_detail_controller.dart';

enum SearchStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class PharmacyDetailState extends Equatable {
  final List<PharmacyAndPricesModel> listPharmacies;
  final SearchStatus status;

  const PharmacyDetailState._({
    required this.listPharmacies,
    required this.status,
  });

  PharmacyDetailState.initial()
      : this._(
          listPharmacies: [],
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props => [listPharmacies, status];

  PharmacyDetailState copyWith({
    List<PharmacyAndPricesModel>? listPharmacies,
    SearchStatus? status,
  }) {
    return PharmacyDetailState._(
      listPharmacies: listPharmacies ?? this.listPharmacies,
      status: status ?? this.status,
    );
  }
}
