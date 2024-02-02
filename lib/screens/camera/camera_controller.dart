import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraController extends GetxController{
  @override
  void onInit() {
    getImage(ImageSource.camera);
    super.onInit();
  }

  File? imageFile;

  Future getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: source);
    if(photo!=null){
      imageFile = File(photo.path);
      update();
    }
  }
}