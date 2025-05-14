import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:teste_funcionalidades_nativas/services/notification_service.dart';
import 'package:teste_funcionalidades_nativas/views/camera_page.dart';
import 'package:teste_funcionalidades_nativas/views/gps_page.dart';
import 'package:teste_funcionalidades_nativas/views/home_page.dart';

late List<CameraDescription> _cameras;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();

  _cameras = await availableCameras();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
      routes: {
        '/camera': (context) => CameraPage(cameras: _cameras),
        '/gps': (context) => GpsPage(),
      },
    );
  }
}