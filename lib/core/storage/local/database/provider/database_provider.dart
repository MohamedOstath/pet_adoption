import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pet_adoption/core/storage/local/database/model/pet.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../../config/constants.dart';

class DatabaseProvider {
  static final DatabaseProvider _instance = DatabaseProvider._internal();

  DatabaseProvider._internal();

  factory DatabaseProvider() {
    return _instance;
  }

  Database? _database;

  Database? get database => _database;

  Future<void> initDatabase() async {
    // path
    Directory directory = await getApplicationCacheDirectory();
    String path = join(directory.path, Constants.databaseName);
    // build schema
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE ${Constants.databasePetTableName} ('
          '${Constants.columnPetId} INTEGER PRIMARY KEY AUTOINCREMENT, '
          '${Constants.columnPetName} TEXT, '
          '${Constants.columnPetAge} INTEGER, '
          '${Constants.columnPetPrice} INTEGER, '
          '${Constants.columnPetDescription} TEXT, '
          '${Constants.columnPetIsAdopted} INTEGER '
          ')',
        );

        await database.execute(
          'CREATE TABLE ${Constants.databaseHistoryTableName} ('
          '${Constants.columnHistoryId} INTEGER PRIMARY KEY AUTOINCREMENT, '
          '${Constants.columnHistoryPetName} TEXT, '
          '${Constants.columnHistoryDateTime} TEXT '
          ')',
        );

        await database.insert(
          Constants.databasePetTableName,
          Pet.fillData(
            name: 'test pet 1',
            age: 1,
            price: 5,
            description: 'test description 1',
          ).toMap(),
        );

        await database.insert(
          Constants.databasePetTableName,
          Pet.fillData(
            name: 'test pet 1',
            age: 1,
            price: 5,
            description: 'test description 1',
          ).toMap(),
        );

        await database.insert(
          Constants.databasePetTableName,
          Pet.fillData(
            name: 'test pet 23',
            age: 32,
            price: 32,
            description: 'test description 32',
          ).toMap(),
        );

        await database.insert(
          Constants.databasePetTableName,
          Pet.fillData(
            name: 'test pet 44',
            age: 44,
            price: 44,
            description: 'test description 44',
          ).toMap(),
        );

        await database.insert(
          Constants.databasePetTableName,
          Pet.fillData(
            name: 'test pet 1',
            age: 1,
            price: 5,
            description: 'test description 1',
          ).toMap(),
        );

        await database.insert(
          Constants.databasePetTableName,
          Pet.fillData(
            name: 'test pet 23',
            age: 32,
            price: 32,
            description: 'test description 32',
          ).toMap(),
        );

        await database.insert(
          Constants.databasePetTableName,
          Pet.fillData(
            name: 'test pet 44',
            age: 44,
            price: 44,
            description: 'test description 44',
          ).toMap(),
        );
      },
      onOpen: (database) {
        print('database is opened');
      },
      onUpgrade: (database, oldVersion, newVersion) {
        print('database is upgraded');
      },
      onDowngrade: (database, oldVersion, newVersion) {},
    );
  }

  _createDefaultPets(Database database) async {
    for (int i = 0; i > 20; i++) {
      await database.insert(
        Constants.databasePetTableName,
        Pet.fillData(
          name: 'test pet ${i + 1}',
          age: i + 1,
          price: i + 5,
          description: 'test description ${i + 1}',
        ).toMap(),
      );
    }
  }
}
