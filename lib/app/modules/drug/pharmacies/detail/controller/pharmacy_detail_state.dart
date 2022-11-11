import 'package:bloc/bloc.dart';
import 'package:discount_card_app/app/models/pharmacy_info_model.dart';
import 'package:discount_card_app/app/services/pharmacy/pharmacy_info_service.dart';
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
  final PharmacyInfoModel? pharmacy;
  final SearchStatus status;

  const PharmacyDetailState._({
    this.pharmacy,
    required this.status,
  });

  const PharmacyDetailState.initial() : this._(status: SearchStatus.initial);

  @override
  List<Object?> get props => [pharmacy, status];

  PharmacyDetailState copyWith({
    PharmacyInfoModel? pharmacy,
    SearchStatus? status,
  }) {
    return PharmacyDetailState._(
      pharmacy: pharmacy ?? this.pharmacy,
      status: status ?? this.status,
    );
  }
}
