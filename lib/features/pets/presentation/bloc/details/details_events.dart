import 'package:equatable/equatable.dart';

import '../../../../../core/storage/local/database/model/pet.dart';

abstract class DetailsEvents extends Equatable {
  const DetailsEvents();

  @override
  List<Object> get props => [];
}

class DetailsEvent extends DetailsEvents {}

class GetPetDetailsEvent extends DetailsEvents {
  final int id;

  GetPetDetailsEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class UpdatePetEvent extends DetailsEvents {
  final Pet pet;

  UpdatePetEvent({required this.pet});

  @override
  List<Object> get props => [pet];
}
