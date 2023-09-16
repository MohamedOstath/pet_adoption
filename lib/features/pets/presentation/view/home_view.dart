import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pet_adoption/core/cache/cache.dart';
import 'package:pet_adoption/core/resources/manager_assets.dart';
import 'package:pet_adoption/core/resources/manager_colors.dart';
import 'package:pet_adoption/core/resources/manager_font_size.dart';
import 'package:pet_adoption/core/resources/manager_height.dart';
import 'package:pet_adoption/core/resources/manager_strings.dart';
import 'package:pet_adoption/core/resources/manager_width.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/pets/pets_bloc.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/pets/pets_states.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/theme/theme_bloc.dart';
import 'package:pet_adoption/features/pets/presentation/view/pets_search_delegate.dart';
import 'package:pet_adoption/route/Routes.dart';
import '../../../../core/resources/manager_radius.dart';
import '../../../../core/resources/manager_tags.dart';
import '../../../../core/storage/local/database/model/pet.dart';
import '../bloc/theme/theme_events.dart';
import '../bloc/theme/theme_states.dart';
import 'history_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // return GetBuilder<PetsController>(builder: (controller) {
    return BlocBuilder<PetsBloc, PetsState>(
      builder: (context, state) {
        if (state is SuccessListState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(ManagerStrings.appName),
              actions: [
                IconButton(
                  onPressed: () {

                    BlocProvider.of<ThemeBloc>(context).add(ChangeThemeEvent(
                        apptheme:  BlocProvider.of<ThemeBloc>(context).state.appTheme ==
                            Apptheme.light
                            ? Apptheme.dark
                            : Apptheme.light
                    ));

                  },
                  icon: Icon(
                    BlocProvider.of<ThemeBloc>(context).state.appTheme ==
                            Apptheme.light
                        ? Icons.dark_mode
                        : Icons.light_mode,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(
                          items: state.pets,
                        ),
                      );
                    },
                    icon: const Icon(Icons.search)),
                PopupMenuButton<String>(
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem<String>(
                        value: 'item1',
                        child: Text(ManagerStrings.adoptHistory),
                      ),
                    ];
                  },
                  onSelected: (String value) {
                    if (value == 'item1') {
                      // Navigator.pushNamed(context, Routes.historyView);
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return HistoryBottomSheet(); // Custom widget for the bottom sheet
                        },
                      );
                    }
                  },
                ),
              ],
            ),
            body: GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: ManagerWidth.w20,
                vertical: ManagerHeight.h20,
              ),
              itemCount: state.pets.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: ManagerHeight.h10,
                crossAxisSpacing: ManagerWidth.w10,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                return CustomPetItem(
                  pet: state.pets[index],
                );
              },
            ),
          );
        } else {
          return Container(
            color: ManagerColors.background,
          );
        }
      },
    );

    // }
  }
}

class CustomPetItem extends StatelessWidget {
  final Pet pet;

  const CustomPetItem({
    super.key,
    required this.pet,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToDetails(context, pet);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            ManagerRadius.r10,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                      ManagerRadius.r10,
                    ),
                    // Adjust the top left corner radius
                    topRight: Radius.circular(
                      ManagerRadius.r10,
                    ), // Adjust the top right corner radius
                  ),
                  child: Hero(
                    tag: '${ManagerHeroTags.petImage}${pet.id}',
                    child: AspectRatio(
                      aspectRatio: 1.3, // 1:1 aspect ratio for the image
                      child: Image.asset(
                        ManagerAssets.avatar,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: pet.isAdopted == 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w8,
                      vertical: ManagerHeight.h8,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: ManagerHeight.h4,
                      horizontal: ManagerWidth.w6,
                    ),
                    decoration: BoxDecoration(
                        color: ManagerColors.red,
                        borderRadius: BorderRadius.circular(
                          ManagerRadius.r100,
                        )),
                    child: Text(
                      ManagerStrings.adopted,
                      style: TextStyle(
                        fontSize: ManagerFontSize.s12,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: ManagerWidth.w6,
                vertical: ManagerHeight.h6,
              ),
              child: Text(
                pet.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: ManagerFontSize.s18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: ManagerWidth.w6,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: ManagerHeight.h4,
                  horizontal: ManagerWidth.w14,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ManagerRadius.r100),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? ManagerColors.whiteOpacity_0_2_5
                      : ManagerColors.primaryColor.withOpacity(0.1),
                ),
                child: Text(
                  '${pet.age} year/s, ${pet.price}',
                  style: const TextStyle(
                    fontSize: ManagerFontSize.s12,
                    color: ManagerColors.primaryColor,
                    // color: Get.isDarkMode
                    //     ? ManagerColors.greyLight
                    //     : ManagerColors.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
