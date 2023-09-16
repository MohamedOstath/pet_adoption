import 'package:equatable/equatable.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/theme/theme_states.dart';

import '../pets/pets_states.dart';

abstract class ThemeEvents extends Equatable {
  const ThemeEvents();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvents {
  final Apptheme apptheme;

  ChangeThemeEvent({required this.apptheme});

  @override
  List<Object> get props => [apptheme];
}
