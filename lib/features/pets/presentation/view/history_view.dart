import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pet_adoption/core/resources/manager_assets.dart';
import 'package:pet_adoption/core/resources/manager_height.dart';
import 'package:pet_adoption/core/resources/manager_strings.dart';
import 'package:pet_adoption/core/resources/manager_width.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/history/history_bloc.dart';
import 'package:pet_adoption/features/pets/presentation/bloc/history/history_states.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_radius.dart';

class HistoryBottomSheet extends StatelessWidget {
  const HistoryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is SuccessListState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                ManagerStrings.adoptHistory,
              ),
            ),
            body: ListView.builder(
              itemCount: state.histories.length,
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
                      ManagerAssets.avatar,
                      // Replace with your image asset path
                      width: ManagerWidth.w50,
                      height: ManagerHeight.h50,
                    ),
                  ),
                  title: Text(state.histories[index].petName),
                  // Replace with your item title
                  subtitle: Text('Time: ${state.histories[index].dateTime}'),
                  // Replace with your item time
                  onTap: () {
                    // Handle item tap
                  },
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
  }
}
