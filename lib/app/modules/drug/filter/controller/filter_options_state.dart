part of 'filter_options_controller.dart';

enum SearchStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class FilterOptionsState extends Equatable {
  final List<DrugsFilterModel> listCoverages;
  final List<DrugsFilterModel> listTypes;
  final List<DrugsFilterModel> listDosages;

  final SearchStatus status;

  const FilterOptionsState._({
    required this.listCoverages,
    required this.listTypes,
    required this.listDosages,
    required this.status,
  });

  FilterOptionsState.initial()
      : this._(
          listCoverages: [],
          listTypes: [],
          listDosages: [],
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props => [listCoverages, listTypes, listDosages, status];

  FilterOptionsState copyWith({
    List<DrugsFilterModel>? listCoverages,
    List<DrugsFilterModel>? listTypes,
    List<DrugsFilterModel>? listDosages,
    SearchStatus? status,
  }) {
    return FilterOptionsState._(
      listCoverages: listCoverages ?? this.listCoverages,
      listTypes: listTypes ?? this.listTypes,
      listDosages: listDosages ?? this.listDosages,
      status: status ?? this.status,
    );
  }
}
