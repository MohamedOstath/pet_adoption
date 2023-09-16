import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/core/storage/local/database/model/history.dart';
import 'package:pet_adoption/core/storage/local/database/model/pet.dart';
import 'package:pet_adoption/core/storage/local/database/provider/database_operations.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/details/details_events.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/pets/pets_events.dart';

import '../pets/pets_bloc.dart';
import 'details_states.dart';

class DetailsBloc extends Bloc<DetailsEvents, DetailsState> {
  final PetDataBaseOperations petDataBaseOperations;
  final PetsBloc petsBloc;

  DetailsBloc({
    required this.petDataBaseOperations,
    required this.petsBloc,
  }) : super(PetsInitial()) {
    on<DetailsEvents>((event, emit) async {
      if (event is GetPetDetailsEvent) {
        // emit(LoadingState());
        final pet = await petDataBaseOperations.show(event.id) ?? Pet();
        emit(SuccessDetailsState(pet: pet));
      } else if (event is UpdatePetEvent) {
        final updated = await petDataBaseOperations.update(event.pet);
        if (updated) {
          emit(SuccessDetailsState(pet: event.pet));

          await petDataBaseOperations.insertHistory(History.fillData(
            petName: event.pet.name,
            dateTime: DateTime.now().toIso8601String(),
          ));
        }
      }
    });
  }
}
