import 'package:camera/camera.dart';
import 'package:chatapp/screens/video_view.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';
import 'cameraviewscreen.dart';

late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void>? cameraValue;
  bool isRecording = false;
  String videopath = "";
  bool flash = false;
  bool isCameraFront = true;
  double transform = 0;

  @override
  void initState() {
    super.initState();
    cameraValue = initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high,
        imageFormatGroup: ImageFormatGroup.yuv420);
    await _cameraController.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      FutureBuilder<void>(
        future: cameraValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: CameraPreview(_cameraController));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      Positioned(
        bottom: 0.0,
        child: Container(
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 5,
          ),
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          flash = !flash;
                        });
                        flash
                            ? _cameraController.setFlashMode(FlashMode.torch)
                            : _cameraController.setFlashMode(FlashMode.off);
                      },
                      icon: Icon(
                        flash ? Icons.flash_on : Icons.flash_off,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        GestureDetector(
                          onLongPress: () async {
                            try {
                              // Start video recording
                              await _cameraController.startVideoRecording();
                              setState(() {
                                isRecording = true;
                              });
                            } catch (e) {
                              print("Error starting video recording: $e");
                            }
                          },
                          onLongPressEnd: (details) async {
                            try {
                              // Stop video recording
                              final XFile videoFile =
                                  await _cameraController.stopVideoRecording();

                              // Get the path of the recorded video
                              videopath = videoFile.path;
                              print("Video saved to $videopath");
                            } catch (e) {
                              print("Error stopping video recording: $e");
                            }
                            setState(() {
                              isRecording = false;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) =>
                                        VideoView(path: videopath)));
                          },
                          onTap: () {
                            if (!isRecording) {
                              takePhoto(context);
                            }
                          },
                          child: isRecording
                              ? const Icon(
                                  Icons.radio_button_on,
                                  color: Colors.red,
                                  size: 80,
                                )
                              : const Icon(
                                  Icons.panorama_fish_eye,
                                  color: Colors.white,
                                  size: 70,
                                ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "Hold for video, Tap for photo",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                      onPressed: () async {
                        setState(() {
                          isCameraFront = !isCameraFront;
                          transform = transform + pi;
                        });
                        int cameraPos = isCameraFront ? 0 : 1;
                        _cameraController = CameraController(
                            cameras[cameraPos], ResolutionPreset.high,
                            imageFormatGroup: ImageFormatGroup.yuv420);
                        await _cameraController.initialize();
                      },
                      icon: Transform.rotate(
                        angle: transform,
                        child: const Icon(
                          Icons.flip_camera_ios,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ]));
  }

  void takePhoto(BuildContext context) async {
    final XFile picture = await _cameraController.takePicture();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => CameraViewScreen(
          path: picture.path,
        ),
      ),
    );
  }
}
