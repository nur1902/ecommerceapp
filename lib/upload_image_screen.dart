import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}
final ImagePicker _picker = ImagePicker();
File? selectedImage;
String? imageName;

class _UploadImageScreenState extends State<UploadImageScreen> {
  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() => selectedImage = File(image.path));
        imageName=image.name;
        uploadImage();
      }
    } catch (e) {
      debugPrint("Gallery pick error: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Couldn't open gallery: $e")),
        );
      }
    }
  }

  Future<void> captureImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() => selectedImage = File(image.path));
        imageName=image.name;
        uploadImage();
      }

    } catch (e) {
      debugPrint("Camera error: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Couldn't open camera: $e")),
        );
      }
    }
  }


  Future<void> uploadImage() async {
    if (selectedImage == null) return;

    //String fileName = generateUniqueFileName(selectedImage!);

    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://daxel.shop/upload.php"),
    );

    request.fields['image_name'] = imageName!;

    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        selectedImage!.path,
        filename: imageName,
      ),
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      print("Uploaded Successfully");
    }
    print(response.statusCode);
    print("hello");
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


          Text('${imageName}'),
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
