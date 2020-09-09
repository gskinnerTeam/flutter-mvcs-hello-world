import 'package:flutter/foundation.dart';

class AppModel extends ChangeNotifier {

  String _currentUser;
  String get currentUser => _currentUser;
  set currentUser(String currentUser) {
    _currentUser = currentUser;
    notifyListeners();
  }
  // Eventually other stuff would go here, appSettings, premiumUser flags, currentTheme, etc...
}
