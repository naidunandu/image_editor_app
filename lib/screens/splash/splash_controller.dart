import 'package:get/get.dart';
import 'package:image_editor_app/router.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _onNavigate();
    super.onInit();
  }

  _onNavigate() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(AppRouter.cameraScreen);
    });
  }
}
