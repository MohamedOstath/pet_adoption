import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pet_adoption/core/theme/manager_dark_theme_data.dart';
import 'package:pet_adoption/core/theme/manager_light_theme.dart';
import 'package:pet_adoption/main.dart';
import 'package:pet_adoption/route/Routes.dart';

void main() {
  setUp(() {});


  testWidgets(
    "title is displayed",
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle(); // Wait for the widget tree to settle.
      expect(find.text('Petadopt'), findsOneWidget);
    },
  );
}
