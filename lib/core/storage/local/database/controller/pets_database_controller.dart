import 'package:pet_adoption/core/storage/local/database/model/pet.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../../config/constants.dart';
import '../model/history.dart';
import '../provider/database_operations.dart';
import '../provider/database_provider.dart';

class PetsDatabaseController extends PetDataBaseOperations {
  Database? database = DatabaseProvider().database;

  @override
  Future<List<Pet>> read() async {
    List<Map<String, Object?>> data =
        await database?.query(Constants.databasePetTableName) ?? [];
    return data.map((e) => Pet.fromMap(e)).toList();
  }

  @override
  Future<Pet?> show(int id) async {
    var data = await database?.query(Constants.databasePetTableName,
        where: '${Constants.columnPetId} = ?', whereArgs: [id]);

    if (data?.isNotEmpty == true) {
      return Pet.fromMap(data!.first);
    }
    return null;
  }

  @override
  Future<bool> update(Pet object) async {
    int? countOfRowsUpdated = await database?.update(
      Constants.databasePetTableName,
      object.toMap(),
      where: '${Constants.columnPetId} = ?',
      whereArgs: [object.id],
    );

    return countOfRowsUpdated != null && countOfRowsUpdated > 0;
  }

  @override
  Future<List<History>> getAllHistory() async {
    List<Map<String, Object?>> data =
        await database?.query(Constants.databaseHistoryTableName) ?? [];
    return data.map((e) => History.fromMap(e)).toList();
  }

  @override
  Future<bool> insertHistory(History history) async {
    int id =
    await database?.insert(Constants.databaseHistoryTableName, history.toMap()) ?? 0;
    return id > 0;
  }
}
