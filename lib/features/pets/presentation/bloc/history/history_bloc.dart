import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/core/storage/local/database/model/pet.dart';
import 'package:pet_adoption/core/storage/local/database/provider/database_operations.dart';

import 'history_events.dart';
import 'history_states.dart';

class HistoryBloc extends Bloc<HistoryEvents, HistoryState> {
  final PetDataBaseOperations petDataBaseOperations;

  HistoryBloc({
    required this.petDataBaseOperations,
  }) : super(PetsInitial()) {
    on<HistoryEvents>((event, emit) async {
      if (event is GetAllHistoryEvent) {
        emit(LoadingState());
        final histories = await petDataBaseOperations.getAllHistory();
        emit(SuccessListState(histories: histories));
      }
    });
  }
}
