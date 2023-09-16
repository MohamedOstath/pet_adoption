import 'package:equatable/equatable.dart';

import '../../../../../core/storage/local/database/model/pet.dart';

abstract class HistoryEvents extends Equatable {
  const HistoryEvents();

  @override
  List<Object> get props => [];
}

class GetAllHistoryEvent extends HistoryEvents {}
