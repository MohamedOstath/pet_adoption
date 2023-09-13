import '../../../../../config/constants.dart';

class Pet {
  late int id;
  late String name;
  late int age;
  late int price;
  late String description;
  late int isAdopted;

  Pet();

  Pet.fillData({
    // required this.id,
    required this.name,
    required this.age,
    required this.price,
    required this.description,
    this.isAdopted = 0,
  });

  Pet.fromMap(Map<String, dynamic> map) {
    id = map[Constants.columnPetId];
    name = map[Constants.columnPetName];
    age = map[Constants.columnPetAge];
    price = map[Constants.columnPetPrice];
    description = map[Constants.columnPetDescription];
    isAdopted = map[Constants.columnPetIsAdopted];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      Constants.columnPetName: name,
      Constants.columnPetAge: age,
      Constants.columnPetPrice: price,
      Constants.columnPetDescription: description,
      Constants.columnPetIsAdopted: isAdopted,
    };
  }
}
