import 'package:flutter_test/flutter_test.dart';
import 'package:pet_adoption/features/pets/presentation/controller/pets_controller.dart';

void main() {
  late PetsController sut;

  setUp(() => {
        sut = PetsController(),
      });

  test(
    "initial values are correct",
    () {
      expect(sut.pets, []);
    },
  );
}
