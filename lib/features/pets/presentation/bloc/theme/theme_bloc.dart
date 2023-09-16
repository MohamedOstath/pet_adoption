import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/core/storage/local/database/model/pet.dart';
import 'package:pet_adoption/core/storage/local/database/provider/database_operations.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/theme/theme_events.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/theme/theme_states.dart';

class ThemeBloc extends Bloc<ThemeEvents, ThemeState> {

  ThemeBloc() : super(ThemeState.initial()) {
    on<ThemeEvents>((event, emit) async {
      if (event is ChangeThemeEvent) {
        emit(ThemeState(appTheme: event.apptheme));
      }
    });
  }
}
