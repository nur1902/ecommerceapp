import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}
final ImagePicker _picker = ImagePicker();
File? selectedImage;

class _UploadImageScreenState extends State<UploadImageScreen> {
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }
  Future<void> captureImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
    );

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  // Future<void> selectMethod()async {
  //   showDialog(context: context, builder: (context) {
  //     return AlertDialog(content: Text("upload method") ,
  //     actions: [
  //       InkWell(
  //         onTap: captureImage,
  //         child: Text('Camera')),
  //       InkWell(
  //           onTap: pickImage,
  //           child: Text("Select from file"))],);
  //   },);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

          selectedImage == null
              ? const Text("No Image")
              : Image.file(
            selectedImage!,
            height: 200,
          ),

          ElevatedButton(
            onPressed: pickImage,
            child: const Text("Gallery"),
          ),

          ElevatedButton(
            onPressed: captureImage,
            child: const Text("Camera"),
          ),
        ],
      )
    );
  }
}
