import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/core/resources/manager_assets.dart';
import 'package:pet_adoption/core/resources/manager_colors.dart';
import 'package:pet_adoption/core/resources/manager_height.dart';
import 'package:pet_adoption/core/resources/manager_width.dart';

import '../../../../route/Routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamed(context, Routes.homeView);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: ManagerWidth.w80,
              height: ManagerHeight.h80,
              child: Image.asset(
                ManagerAssets.splashIcon,
              ),
            ),
            const SizedBox(
              height: ManagerHeight.h20,
            ),
            Text(
              'petadopt',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
