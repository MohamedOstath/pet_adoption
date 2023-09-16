import 'package:equatable/equatable.dart';

enum Apptheme { light, dark }

class ThemeState extends Equatable {
  final Apptheme appTheme;

  ThemeState({
    required this.appTheme,
  });

  factory ThemeState.initial() {
    return ThemeState(appTheme: Apptheme.light);
  }

  @override
  List<Object> get props => [Apptheme];

  ThemeState copyWith({
    Apptheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }
}
