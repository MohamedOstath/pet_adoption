import 'package:equatable/equatable.dart';

import '../../../../../core/storage/local/database/model/pet.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

class PetsInitial extends DetailsState {}

class LoadingState extends DetailsState {}

class SuccessListState extends DetailsState {
  final List<Pet> pets;

  SuccessListState({required this.pets});

  @override
  List<Object> get props => [pets];
}

class SuccessDetailsState extends DetailsState {
  final Pet pet;

  SuccessDetailsState({required this.pet});

  @override
  List<Object> get props => [pet];
}
