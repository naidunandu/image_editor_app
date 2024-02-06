import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_editor_app/screens/camera/camera_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

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
            automaticallyImplyLeading: false,
            title: const Text("Camera"),
            actions: [
              IconButton(
                onPressed: () async => _.getImage(ImageSource.camera),
                icon: const Icon(Icons.camera),
              ),
              IconButton(
                onPressed: () async => _.getImage(ImageSource.gallery),
                icon: const Icon(Icons.browse_gallery),
              ),
              IconButton(
                onPressed: _.isDownloading ? null : () async => _.saveWidgetAsImage(context),
                icon: _.isDownloading ? const CircularProgressIndicator() : const Icon(Icons.download),
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: _.imageFile != null
                    ? WidgetsToImage(
                        controller: _.controller,
                        child: Stack(
                          children: [
                            Image.file(_.imageFile!),
                            Stack(
                              children: _.shapes.map((shape) {
                                final GlobalKey key = GlobalKey();
                                return Positioned(
                                  left: shape.position.dx,
                                  top: shape.position.dy,
                                  child: Draggable(
                                    key: key,
                                    feedback: shape.widget,
                                    childWhenDragging: Container(),
                                    onDragEnd: (value) {
                                      shape.position = value.offset;
                                      _.update();
                                    },
                                    child: shape.widget,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ),
              GestureDetector(
                onTap: () => _.addShape(),
                child: Container(
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.add, color: Colors.white),
                          Text("저장하기", style: TextStyle(color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
