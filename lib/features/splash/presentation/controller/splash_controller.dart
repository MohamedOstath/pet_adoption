import 'package:get/get.dart';
import 'package:pet_adoption/config/constants.dart';

import '../../../../route/Routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(
      const Duration(seconds: Constants.splashTimeSecond),
      () {
        Get.offAllNamed(Routes.homeView);
      },
    );
  }
}
