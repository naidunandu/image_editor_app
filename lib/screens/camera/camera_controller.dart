import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class CameraController extends GetxController {
  @override
  void onInit() {
    getImage(ImageSource.camera);
    super.onInit();
  }

  File? imageFile;
  List<DraggableShape> shapes = [];
  WidgetsToImageController controller = WidgetsToImageController();

  bool isDownloading = false;
  Future<void> saveWidgetAsImage(context) async {
    isDownloading = true;
    update();
    final byteData = await controller.capture();
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    // Save the image to a file
    final directory = await getDownloadsDirectory();
    final filePath = '${directory!.path}/widget_image.png';
    File file = File(filePath);
    await file.writeAsBytes(pngBytes);
    isDownloading = false;
    update();
    Get.snackbar("Downloaded", 'Image saved to: $filePath', backgroundColor: Colors.amber, snackPosition: SnackPosition.BOTTOM);
  }

  Future getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: source);
    if (photo != null) {
      imageFile = File(photo.path);
    }
    update();
  }

  addShape() async {
    shapes.add(DraggableShape(
      type: ShapeType.rectangle,
      position: Offset(70.0, 70.0),
    ));
    update();
  }
}

enum ShapeType {
  rectangle,
  // Add more shapes as needed
}

class DraggableShape {
  final ShapeType type;
  Offset position;

  DraggableShape({
    required this.type,
    required this.position,
  });

  Widget get widget {
    if (type == ShapeType.rectangle) {
      return Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.green.shade400.withOpacity(.3),
            border: Border.all(color: Colors.green, width: 1)),
      );
    }
    // Add more shape widgets as needed
    return Container();
  }
}
