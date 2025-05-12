import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraPage({required this.cameras,super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  late Future<void> _initializeControllerFuture;


  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    _initializeControllerFuture = controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    });
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(!controller.value.isInitialized){
      return Container(child: Text("Câmera não permitida"),);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Câmera"),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else{
            return CameraPreview(controller);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        try{
          await _initializeControllerFuture;
          final image = await controller.takePicture();
          if (!mounted) return;
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ImagemDisplayPage(imagePath: image.path),),
          );
        } catch (e){
          print("Ocorreu um erro");
        }
      },child: Icon(Icons.camera_alt),),
    );
  }
}

class ImagemDisplayPage extends StatelessWidget {
  final String imagePath;
  const ImagemDisplayPage({required this.imagePath,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sua foto:"),),
      body: Image.file(File(imagePath)),
    );
  }
}

