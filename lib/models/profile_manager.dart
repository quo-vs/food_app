import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';

class ProfileManager extends ChangeNotifier {
  User get getUser => User(
    firstName: 'Stef',
    lastName: 'Patt',
    role: 'Flutterista',
    profileImageUrl: 'assets/profile_pics/person_stef.jpeg',
    points: 100,
    darkMode: _darkMode,
  );

  bool get didSelectUser => _didSelectUser;
  bool get didTapOnRaywe => _tapOnRaywe;
  bool get darkMode => _darkMode;

  var _didSelectUser = false;
  var _tapOnRaywe = false;
  var _darkMode = false;

  void set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

    void set tapOnRaywe(bool selected) {
    _tapOnRaywe = selected;
    notifyListeners();
  }

    void set tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}