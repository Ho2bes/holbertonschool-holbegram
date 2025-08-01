import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String uid;
  final String email;
  final String username;
  final String bio;
  final String photoUrl;
  final List<dynamic> followers;
  final List<dynamic> following;
  final List<dynamic> posts;
  final List<dynamic> saved;
  final String searchKey;

  Users({
    required this.uid,
    required this.email,
    required this.username,
    required this.bio,
    required this.photoUrl,
    required this.followers,
    required this.following,
    required this.posts,
    required this.saved,
    required this.searchKey,
  });

  // Factory constructor to create a Users object from Firestore snapshot
  static Users fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>? ?? {};

    return Users(
      uid: snapshot['uid'] ?? '',
      email: snapshot['email'] ?? '',
      username: snapshot['username'] ?? '',
      bio: snapshot['bio'] ?? '',
      photoUrl: snapshot['photoUrl'] ?? '',
      followers: List<dynamic>.from(snapshot['followers'] ?? []),
      following: List<dynamic>.from(snapshot['following'] ?? []),
      posts: List<dynamic>.from(snapshot['posts'] ?? []),
      saved: List<dynamic>.from(snapshot['saved'] ?? []),
      searchKey: snapshot['searchKey'] ?? '',
    );
  }

  // Convert a Users object to JSON (Map<String, dynamic>)
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'username': username,
        'bio': bio,
        'photoUrl': photoUrl,
        'followers': followers,
        'following': following,
        'posts': posts,
        'saved': saved,
        'searchKey': searchKey,
      };
}
