import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/core/resources/manager_assets.dart';
import 'package:pet_adoption/core/resources/manager_height.dart';
import 'package:pet_adoption/core/resources/manager_strings.dart';
import 'package:pet_adoption/core/resources/manager_width.dart';
import 'package:pet_adoption/features/pets/presentation/controller/pets_controller.dart';

import '../../../../core/resources/manager_radius.dart';

class MyBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PetsController>(builder: (controller) {
      controller.getAllHistory();
      return Scaffold(
        appBar: AppBar(
          title: Text(
            ManagerStrings.adoptHistory,
          ),
        ),
        body: ListView.builder(
          itemCount: controller.history.length,
          // Replace with your desired item count
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    ManagerRadius.r10,
                  ),
                ),
                child: Image.asset(
                  ManagerAssets.avatar, // Replace with your image asset path
                  width: ManagerWidth.w50,
                  height: ManagerHeight.h50,
                ),
              ),
              title: Text(controller.history[index].petName),
              // Replace with your item title
              subtitle: Text('Time: ${controller.history[index].dateTime}'),
              // Replace with your item time
              onTap: () {
                // Handle item tap
              },
            );
          },
        ),
      );
    });
  }
}
