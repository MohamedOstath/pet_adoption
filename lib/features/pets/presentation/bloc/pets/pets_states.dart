import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/storage/local/database/model/pet.dart';

abstract class PetsState extends Equatable {
  const PetsState();

  @override
  List<Object> get props => [];
}

class PetsInitial extends PetsState {}

class LoadingState extends PetsState {}

class SuccessListState extends PetsState {
  final List<Pet> pets;

  SuccessListState({required this.pets});

  @override
  List<Object> get props => [pets];
}




