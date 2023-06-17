import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';
import 'dart:async';
import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mime/mime.dart';
// import 'package:video_player/video_player.dart';
class DocumentsView extends StatefulWidget {
  DocumentsView({super.key});

  @override
  State<DocumentsView> createState() => _DocumentsViewState();
}

class _DocumentsViewState extends State<DocumentsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: PalleteColor.whiteColor,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: ()=> Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: PalleteColor.primaryColor)
          ),
          title: Text('Mis Documentos', style: Theme.of(context).textTheme.headlineSmall!.merge(TextStyle(color: PalleteColor.primaryColor, fontWeight: FontWeight.bold))),
        ),
        backgroundColor: PalleteColor.whiteColor,
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Gestor de Documentos', style: Theme.of(context).textTheme.titleMedium!.merge(TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              SizedBox(height: MediaQuery.of(context).size.height * .024),
              Text('Carnet de Identidad anverso', style: Theme.of(context).textTheme.titleMedium!.merge(TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
              SizedBox(height: MediaQuery.of(context).size.height * .012),
              Container(
                height: 200.0,
                alignment: Alignment.center,
                child: _optionalScanningValue == null
                ? Text('Carnet de Identidad anverso vacio')
                : Container(
                    decoration: BoxDecoration(border: Border.all(color: PalleteColor.primaryColor, width: 2.0)),
                    child: Image.file(
                      _optionalScanningValue!,
                      fit: BoxFit.contain,
                    ),
                  )),
              SizedBox(height: MediaQuery.of(context).size.height * .012),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PalleteColor.primaryColor,
                    ),
                    onPressed: () => captureImage(context, fromGallery: false, type: true),
                    child: const Icon(Icons.camera, color: Colors.white),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PalleteColor.primaryColor,
                    ),
                    onPressed: () => captureImage(context, fromGallery: true, type: true),
                    child: const Icon(Icons.image_rounded, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .048),
              Text('Carnet de Identidad reverso', style: Theme.of(context).textTheme.titleMedium!.merge(TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
              SizedBox(height: MediaQuery.of(context).size.height * .012),
              Container(
                height: 200.0,
                alignment: Alignment.center,
                child: _optionalScanningValue1 == null
                ? Text('Carnet de Identidad reverso vacio')
                : Container(
                    decoration: BoxDecoration(border: Border.all(color: PalleteColor.primaryColor, width: 2.0)),
                    child: Image.file(
                      _optionalScanningValue1!,
                      fit: BoxFit.contain,
                    ),
                  )),
              SizedBox(height: MediaQuery.of(context).size.height * .012),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PalleteColor.primaryColor,
                    ),
                    onPressed: () => captureImage(context, fromGallery: false, type: false),
                    child: const Icon(Icons.camera, color: Colors.white),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PalleteColor.primaryColor,
                    ),
                    onPressed: () => captureImage(context, fromGallery: true, type: false),
                    child: const Icon(Icons.image_rounded, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  XFile? _pickedFile;

  final picker = ImagePicker();
  var _optionalScanningValue;
  var _optionalScanningValue1;

  Future captureImage(BuildContext context, {bool fromGallery = true, bool type=true}) async {
    FocusScope.of(context).unfocus();
    _pickedFile = await picker.pickImage(source: fromGallery ? ImageSource.gallery : ImageSource.camera);
    print(_pickedFile);
    if(type) _optionalScanningValue = await exIf(path: _pickedFile!.path);
    if(!type) _optionalScanningValue1 = await exIf(path: _pickedFile!.path);

    setState(() {
    });
  }

  Future<File> exIf({@required path}) async {
    final properties;
    if (Platform.isAndroid) {
      final image = await FlutterExifRotation.rotateImage(path: path);
      properties = await FlutterNativeImage.getImageProperties(image.path);
    } else {
      properties = await FlutterNativeImage.getImageProperties(path);
    }
    return await FlutterNativeImage.compressImage(
      path,
      quality: 80,
      targetWidth: 410,
      targetHeight: (properties.height! * 410 / properties.width!).round(),
    );
  }
}

class ImageProperties {
  int? width;
  int? height;
  ImageOrientation orientation;

  ImageProperties(
      {this.width = 0,
      this.height = 0,
      this.orientation = ImageOrientation.undefined});
}

/// Imageorientation enum used for [getImageProperties].
enum ImageOrientation {
  normal,
  rotate90,
  rotate180,
  rotate270,
  flipHorizontal,
  flipVertical,
  transpose,
  transverse,
  undefined,
}