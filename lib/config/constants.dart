class Constants {
  static const int splashTimeSecond = 2;

  static const String databaseName = 'pet_adopt';

  //pets table
  static const String databasePetTableName = 'pet';
  static const String columnPetId = 'id';
  static const String columnPetName = 'name';
  static const String columnPetAge = 'age';
  static const String columnPetPrice = 'price';
  static const String columnPetDescription = 'description';
  static const String columnPetIsAdopted = 'is_adopted';

  //history table
  static const String databaseHistoryTableName = 'history';
  static const String columnHistoryId = 'id';
  static const String columnHistoryPetName = 'pet_name';
  static const String columnHistoryDateTime = 'date_time';

  static const String prefKeyTheme = 'theme_key';
  static const String dark = 'dark';
  static const String light = 'light';
}
