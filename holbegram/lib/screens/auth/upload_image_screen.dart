import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:holbegram/screens/login_screen.dart';
import 'package:holbegram/methods/auth_methods.dart';

class UploadImageScreen extends StatefulWidget {
  final String email;
  final String username;
  final String password;

  const UploadImageScreen({
    super.key,
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  Uint8List? _image;

  void selectImageFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final imageBytes = await picked.readAsBytes();
      setState(() {
        _image = imageBytes;
      });
    }
  }

  void selectImageFromCamera() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      final imageBytes = await picked.readAsBytes();
      setState(() {
        _image = imageBytes;
      });
    }
  }

  void signUp() async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please select an image")));
      return;
    }

    String res = await AuthMethode().signUpUser(
      email: widget.email,
      password: widget.password,
      username: widget.username,
      file: _image!,
    );

    if (!mounted) return;
    if (res == "success") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Success")));
      Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Image')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 64,
                backgroundImage: _image != null ? MemoryImage(_image!) : null,
                child: _image == null ? const Icon(Icons.person, size: 64) : null,
              ),
              Positioned(
                bottom: -10,
                left: 80,
                child: IconButton(
                  onPressed: selectImageFromGallery,
                  icon: const Icon(Icons.add_a_photo),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(widget.username, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: signUp,
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }
}
