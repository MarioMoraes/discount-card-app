import 'package:bloc/bloc.dart';
import 'package:discount_card_app/app/models/card_select_model.dart';
import 'package:equatable/equatable.dart';

part 'coverage_controller.dart';

enum SearchStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class CoverageState extends Equatable {
  final List<CardSelectModel> list;
  final SearchStatus status;

  const CoverageState._({
    required this.list,
    required this.status,
  });

  CoverageState.initial()
      : this._(
          list: [],
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props => [list, status];

  CoverageState copyWith({
    List<CardSelectModel>? list,
    SearchStatus? status,
  }) {
    return CoverageState._(
      list: list ?? this.list,
      status: status ?? this.status,
    );
  }
}
