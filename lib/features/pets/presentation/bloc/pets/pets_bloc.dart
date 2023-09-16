import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/core/storage/local/database/model/pet.dart';
import 'package:pet_adoption/core/storage/local/database/provider/database_operations.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/pets/pets_events.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/pets/pets_states.dart';

class PetsBloc extends Bloc<PetsEvents, PetsState> {
  final PetDataBaseOperations petDataBaseOperations;

  PetsBloc({
    required this.petDataBaseOperations,
  }) : super(PetsInitial()) {
    on<PetsEvents>((event, emit) async {
      if (event is GetAllPetsEvent) {
        emit(LoadingState());
        final pets = await petDataBaseOperations.read();
        emit(SuccessListState(pets: pets));
      }
    });
  }
}
