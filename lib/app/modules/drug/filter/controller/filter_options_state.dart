part of 'filter_options_controller.dart';

enum SearchStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class FilterOptionsState extends Equatable {
  final SearchStatus status;

  const FilterOptionsState._({
    required this.status,
  });

  const FilterOptionsState.initial()
      : this._(
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props => [status];

  FilterOptionsState copyWith({
    SearchStatus? status,
  }) {
    return FilterOptionsState._(
      status: status ?? this.status,
    );
  }
}
