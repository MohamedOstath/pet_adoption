import '../../../../../config/constants.dart';

class History {
  late int id;
  late String petName;
  late String dateTime;

  History();

  History.fillData({
    // required this.id,
    required this.petName,
    required this.dateTime,
  });

  History.fromMap(Map<String, dynamic> map) {
    id = map[Constants.columnPetId];
    petName = map[Constants.columnHistoryPetName];
    dateTime = map[Constants.columnHistoryDateTime];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      Constants.columnHistoryPetName: petName,
      Constants.columnHistoryDateTime: dateTime,
    };
  }
}
