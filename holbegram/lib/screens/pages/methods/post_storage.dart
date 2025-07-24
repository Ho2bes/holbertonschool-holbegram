import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holbegram/screens/auth/methods/user_storage.dart';

class PostStorage {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String caption,
    String uid,
    String username,
    String profImage,
    Uint8List image,
  ) async {
    String res = "An error occurred";
    try {
      // Upload image and get the URL
      final urlData = await uploadImageToCloudinary(image);

      if (urlData != null && urlData['secure_url'] != null && urlData['public_id'] != null) {
        final postId = _firestore.collection('posts').doc().id;

        await _firestore.collection('posts').doc(postId).set({
          'caption': caption,
          'uid': uid,
          'username': username,
          'profImage': profImage,
          'postUrl': urlData['secure_url'],
          'publicId': urlData['public_id'],
          'postId': postId,
          'datePublished': DateTime.now(),
          'likes': [],
        });

        res = "Ok";
      } else {
        res = "Failed to upload image.";
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<void> deletePost(String postId, String publicId) async {
    try {
      // Supprime de Cloudinary
      await deleteImageFromCloudinary(publicId);

      // Supprime de Firestore
      await _firestore.collection('posts').doc(postId).delete();
    } catch (e) {
      print("Erreur lors de la suppression du post : $e");
    }
  }
}
