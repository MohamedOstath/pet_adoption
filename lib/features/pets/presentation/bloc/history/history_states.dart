import 'package:equatable/equatable.dart';
import 'package:pet_adoption/core/storage/local/database/model/history.dart';

import '../../../../../core/storage/local/database/model/pet.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

class PetsInitial extends HistoryState {}

class LoadingState extends HistoryState {}

class SuccessListState extends HistoryState {
  final List<History> histories;

  SuccessListState({required this.histories});

  @override
  List<Object> get props => [histories];
}
