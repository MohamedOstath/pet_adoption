import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:pet_adoption/core/storage/local/database/controller/pets_database_controller.dart';
import 'package:pet_adoption/core/storage/local/database/provider/database_operations.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/history/history_bloc.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/theme/theme_bloc.dart';
// import 'package:pet_adoption/features/pets/presentation/controller/pets_controller.dart';

import '../core/storage/local/database/provider/database_provider.dart';
import '../features/pets/presentation/bloc/details/details_bloc.dart';
import '../features/pets/presentation/bloc/pets/pets_bloc.dart';
// import '../features/splash/presentation/controller/splash_controller.dart';

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseProvider().initDatabase();
}
//
// initSplash() {
//   Get.put<SplashController>(SplashController());
// }
//
// disposeSplash() {
//   Get.delete<SplashController>();
// }
//
// initPets() {
//   disposeSplash();
//   Get.put<PetsController>(PetsController());
// }

final sl = GetIt.instance;

Future<void> initBlocProviders() async {
  WidgetsFlutterBinding.ensureInitialized();

  sl.registerFactory(() => PetsBloc(
        petDataBaseOperations: sl(),
      ));

  sl.registerFactory(() => DetailsBloc(
        petDataBaseOperations: sl(),
        petsBloc: sl(),
      ));

  sl.registerFactory(() => HistoryBloc(
        petDataBaseOperations: sl(),
      ));

  sl.registerFactory(() => ThemeBloc());

  sl.registerLazySingleton<PetDataBaseOperations>(
      () => PetsDatabaseController());
}
