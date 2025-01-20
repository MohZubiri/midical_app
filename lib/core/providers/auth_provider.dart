import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String? _userId;
  String? _userEmail;

  bool get isAuthenticated => _isAuthenticated;
  String? get userId => _userId;
  String? get userEmail => _userEmail;

  Future<bool> signIn(String email, String password) async {
    try {
      // TODO: Implement Firebase Authentication
      _isAuthenticated = true;
      _userEmail = email;
      _userId = 'user_id'; // This will come from Firebase
      notifyListeners();
      return true;
    } catch (e) {
      _isAuthenticated = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async {
    try {
      // TODO: Implement Firebase Authentication
      _isAuthenticated = true;
      _userEmail = email;
      _userId = 'user_id'; // This will come from Firebase
      notifyListeners();
      return true;
    } catch (e) {
      _isAuthenticated = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> signOut() async {
    // TODO: Implement Firebase Sign Out
    _isAuthenticated = false;
    _userEmail = null;
    _userId = null;
    notifyListeners();
  }
}