// ignore: import_of_legacy_library_into_null_safe
import 'package:camera/camera.dart';
import 'package:chatapp/screens/camerascreen.dart';
import 'package:chatapp/screens/homescreen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Homescreen(),
    );
  }
}
