import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/core/cache/cache.dart';
import 'package:pet_adoption/core/theme/manager_dark_theme_data.dart';
import 'package:pet_adoption/core/theme/manager_light_theme.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/history/history_bloc.dart';
import 'package:pet_adoption/route/Routes.dart';

import 'config/dependency_injection.dart' as di;
import 'features/pets/presentation/bloc/details/details_bloc.dart';
import 'features/pets/presentation/bloc/details/details_events.dart';
import 'features/pets/presentation/bloc/history/history_events.dart';
import 'features/pets/presentation/bloc/pets/pets_bloc.dart';
import 'features/pets/presentation/bloc/pets/pets_events.dart';
import 'features/pets/presentation/bloc/pets/pets_states.dart';
import 'features/pets/presentation/bloc/theme/theme_bloc.dart';
import 'features/pets/presentation/bloc/theme/theme_states.dart';

void main() async {
  await di.initModule();
  await di.initBlocProviders();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.sl<PetsBloc>()..add(GetAllPetsEvent()),
          ),
          BlocProvider(
            create: (_) => di.sl<DetailsBloc>()
              ..add(
                GetPetDetailsEvent(
                  id: CacheData().getPetId(),
                ),
              ),
          ),
          BlocProvider(
            create: (_) => di.sl<HistoryBloc>()..add(GetAllHistoryEvent())
          ),
          BlocProvider(create: (_) => di.sl<ThemeBloc>()),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splashView,
            onGenerateRoute: RouteGenerator.getRoute,
            theme: context.watch<ThemeBloc>().state.appTheme == Apptheme.light
                ? managerLightThemeData()
                : managerDarkThemeData(),
          );
        }));
  }
}
