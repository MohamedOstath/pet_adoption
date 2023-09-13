import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/core/cache/cache.dart';
import 'package:pet_adoption/core/storage/local/database/controller/pets_database_controller.dart';
import 'package:pet_adoption/core/storage/local/database/model/history.dart';
import 'package:pet_adoption/core/storage/local/database/model/pet.dart';

class PetsController extends GetxController {
  final PetsDatabaseController petsDatabaseController =
      PetsDatabaseController();

  List<Pet> pets = [];
  List<History> history = [];

  Pet currentPet = Pet.fillData(
    name: '',
    age: 0,
    price: 0,
    description: '',
  );

  // theme toggle
  bool get isDarkMode => Get.isDarkMode;

  void toggleThemeMode() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    update();
  }

  Future<void> read() async {
    pets = await petsDatabaseController.read();
    update();
  }

  Future<void> show() async {
    currentPet =
        await petsDatabaseController.show(CacheData().getPetId()) ?? Pet();
    update();
  }

  Future<bool> updatePet() async {
    currentPet.isAdopted = currentPet.isAdopted == 0 ? 1 : 0;
    bool updated = await petsDatabaseController.update(currentPet);

    if (updated) {
      pets[pets.indexWhere((element) => element.id == currentPet.id)] =
          currentPet;
      update();

      await petsDatabaseController.insertHistory(History.fillData(
        petName: currentPet.name,
        dateTime: DateTime.now().toIso8601String(),
      ));

      return true;
    }
    return false;
  }

  Future<void> insertHistory({required History history}) async {
    await petsDatabaseController.insertHistory(history);
  }

  Future<void> getAllHistory() async {
    history = await petsDatabaseController.getAllHistory();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    read();
  }
}
