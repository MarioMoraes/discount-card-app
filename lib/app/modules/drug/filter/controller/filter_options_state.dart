part of 'filter_options_controller.dart';

enum SearchStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class FilterOptionsState extends Equatable {
  final List<CardSelectModel> listCoverages;
  final List<CardSelectModel> listTypes;
  final List<CardSelectModel> listDosages;
  final int distance;
  final int quantity;

  final SearchStatus status;

  const FilterOptionsState._({
    required this.listCoverages,
    required this.listTypes,
    required this.listDosages,
    required this.status,
    required this.distance,
    required this.quantity,
  });

  FilterOptionsState.initial()
      : this._(
          listCoverages: [],
          listTypes: [],
          listDosages: [],
          distance: 5,
          quantity: 1,
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props =>
      [listCoverages, listTypes, listDosages, distance, quantity, status];

  FilterOptionsState copyWith({
    List<CardSelectModel>? listCoverages,
    List<CardSelectModel>? listTypes,
    List<CardSelectModel>? listDosages,
    int? distance,
    int? quantity,
    SearchStatus? status,
  }) {
    return FilterOptionsState._(
      listCoverages: listCoverages ?? this.listCoverages,
      listTypes: listTypes ?? this.listTypes,
      listDosages: listDosages ?? this.listDosages,
      distance: distance ?? this.distance,
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
    );
  }
}
