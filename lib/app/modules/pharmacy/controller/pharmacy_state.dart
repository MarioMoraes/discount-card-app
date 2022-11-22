import 'package:bloc/bloc.dart';
import 'package:discount_card_app/app/models/pharmacy_location.dart';
import 'package:discount_card_app/app/services/pharmacy/pharmacy_list/pharmacy_list_service.dart';
import 'package:equatable/equatable.dart';

part 'pharmacy_controller.dart';

enum SearchStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class PharmacyState extends Equatable {
  final List<PharmacyLocation> listPharmacies;
  final SearchStatus status;

  const PharmacyState._({
    required this.listPharmacies,
    required this.status,
  });

  PharmacyState.initial()
      : this._(
          listPharmacies: [],
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props => [listPharmacies, status];

  PharmacyState copyWith({
    List<PharmacyLocation>? listPharmacies,
    SearchStatus? status,
  }) {
    return PharmacyState._(
      listPharmacies: listPharmacies ?? this.listPharmacies,
      status: status ?? this.status,
    );
  }
}
