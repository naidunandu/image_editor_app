import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_editor_app/screens/camera/camera_controller.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CameraController>(
      init: CameraController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Camera"),
            actions: [
              IconButton(
                onPressed: () async => _.getImage(ImageSource.camera),
                icon: const Icon(Icons.camera),
              ),
              IconButton(
                onPressed: () async => _.getImage(ImageSource.gallery),
                icon: const Icon(Icons.browse_gallery),
              )
            ],
          ),
          body: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Column(
                      children: [],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
