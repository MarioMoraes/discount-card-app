part of 'filter_options_controller.dart';

enum SearchStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class FilterOptionsState extends Equatable {
  final List<DrugsFilterModel> list;
  final SearchStatus status;

  const FilterOptionsState._({
    required this.list,
    required this.status,
  });

  FilterOptionsState.initial()
      : this._(
          list: [],
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props => [list, status];

  FilterOptionsState copyWith({
    List<DrugsFilterModel>? list,
    SearchStatus? status,
  }) {
    return FilterOptionsState._(
      list: list ?? this.list,
      status: status ?? this.status,
    );
  }
}
