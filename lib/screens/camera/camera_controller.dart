import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraController extends GetxController{
  @override
  void onInit() {
    getImage(ImageSource.camera);
    super.onInit();
  }

  File? imageFile;
  List<DraggableShape> shapes = [];

  Future getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: source);
    if(photo!=null){
      imageFile = File(photo.path);
    }
    update();
  }

  addShape() async{
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
        color: Colors.green.shade50,
      );
    }
    // Add more shape widgets as needed
    return Container();
  }
}