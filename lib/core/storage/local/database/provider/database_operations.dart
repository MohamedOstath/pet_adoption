
import 'package:pet_adoption/core/storage/local/database/model/pet.dart';

import '../model/history.dart';

abstract class PetDataBaseOperations {
  Future<List<Pet>> read();

  Future<Pet?> show(int id);

  Future<bool> update(Pet object);

  Future<bool> insertHistory(History history);

  Future<List<History>> getAllHistory();
}
