
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/features/pets/presentation/controller/pets_controller.dart';

import '../core/storage/local/database/provider/database_provider.dart';
import '../features/splash/presentation/controller/splash_controller.dart';

initModule() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseProvider().initDatabase();
}


initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initPets(){
  disposeSplash();
  Get.put<PetsController>(PetsController());
}
