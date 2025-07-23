import 'package:flutter/foundation.dart';
import 'package:holbegram/models/user.dart';
import 'package:holbegram/methods/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethode _authMethode = AuthMethode();

  User? get getUser => _user;

  Future<void> refreshUser() async {
    User user = await _authMethode.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
