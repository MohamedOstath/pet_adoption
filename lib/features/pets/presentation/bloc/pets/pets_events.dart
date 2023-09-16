import 'package:equatable/equatable.dart';

import '../../../../../core/storage/local/database/model/pet.dart';

abstract class PetsEvents extends Equatable {
  const PetsEvents();

  @override
  List<Object> get props => [];
}

class GetAllPetsEvent extends PetsEvents {}
