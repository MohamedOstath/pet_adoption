import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pet_adoption/core/cache/cache.dart';
import 'package:pet_adoption/core/resources/manager_assets.dart';
import 'package:pet_adoption/core/resources/manager_colors.dart';
import 'package:pet_adoption/core/resources/manager_font_size.dart';
import 'package:pet_adoption/core/resources/manager_radius.dart';
import 'package:pet_adoption/core/resources/manager_strings.dart';
import 'package:pet_adoption/core/resources/manager_tags.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/details/details_bloc.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/details/details_states.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_width.dart';
import '../bloc/details/details_events.dart';
import '../bloc/pets/pets_bloc.dart';
import '../bloc/pets/pets_events.dart';

class PetDetailsView extends StatelessWidget {
  const PetDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        print(state.props);
        print(state);
        if (state is SuccessDetailsState) {

          // update home list when updating is adopted
          if(state.pet.isAdopted == 1) {
            updateHomeList(context);
          }

          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: const BackButton(
                color: ManagerColors.white,
              ),
              backgroundColor: ManagerColors.transparent,
              title: Text(
                state.pet.name,
                style: const TextStyle(
                  color: ManagerColors.white,
                ),
              ),
            ),
            body: Stack(
              children: [
                Hero(
                  tag: '${ManagerHeroTags.petImage}${CacheData().getPetId()}',
                  child: ClipRRect(
                    child: AspectRatio(
                      aspectRatio: 0.85,
                      child: Image.asset(
                        ManagerAssets.avatar,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: ManagerWidth.w20,
                          vertical: ManagerHeight.h20,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ManagerColors.cornerViewDetailsBg,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(ManagerRadius.r20),
                            topRight: Radius.circular(ManagerRadius.r20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.pet.name,
                              style: const TextStyle(
                                fontSize: ManagerFontSize.s24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: ManagerHeight.h16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                customLabelDetails(
                                  color: ManagerColors.primaryColor,
                                  label: '${state.pet.age} year\\s',
                                ),
                                const SizedBox(
                                  width: ManagerWidth.w8,
                                ),
                                customLabelDetails(
                                  color: ManagerColors.green,
                                  label: '${state.pet.price} \$',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: ManagerHeight.h16,
                            ),
                            Text(
                              state.pet.description,
                              style: const TextStyle(
                                color: ManagerColors.descriptionColor,
                                fontSize: ManagerFontSize.s12,
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            MaterialButton(
                              // padding: padding,
                              onPressed: state.pet.isAdopted == 0
                                  ? () {
                                      BlocProvider.of<DetailsBloc>(context).add(
                                        UpdatePetEvent(
                                          pet: state.pet.copyWithIsAdopted(1),
                                        ),
                                      );
                                    }
                                  : null,
                              minWidth: double.infinity,
                              height: ManagerHeight.h48,
                              color: Theme.of(context).primaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  ManagerRadius.r10,
                                ),
                              ),
                              child: Text(
                                state.pet.isAdopted == 0
                                    ? ManagerStrings.adoptMe
                                    : ManagerStrings.alreadyAdopted,
                                style: const TextStyle(
                                  fontSize: ManagerFontSize.s16,
                                  color: ManagerColors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        } else {
          return Container(
            color: ManagerColors.background,
          );
        }
      },
    );
    // });
  }

  Container customLabelDetails({
    required Color color,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: ManagerHeight.h10,
        horizontal: ManagerWidth.w10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ManagerRadius.r10),
        color: color.withOpacity(0.25),
      ),
      child: Text(
        label,
        style: TextStyle(
          color:color,
        ),
      ),
    );
  }
}

updateHomeList(BuildContext context){
  BlocProvider.of<PetsBloc>(context).add(GetAllPetsEvent());
}