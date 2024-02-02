import 'package:get/get.dart';
import 'package:image_editor_app/screens/camera/camera.dart';
import 'package:image_editor_app/screens/splash/splash.dart';

class AppRouter{
  static const splashScreen = "/splashScreen";
  static const cameraScreen = "/cameraScreen";


  static var routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: cameraScreen, page: () => const CameraScreen()),
  ];
}