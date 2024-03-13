import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeController with ChangeNotifier {
  Locale? _applocale;
  Locale? get appLocale => _applocale;

  void changeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _applocale = type;
    if (type == Locale('en')) {
      sp.setString('languageCode', 'en');
    } else {
      sp.setString('languageCode', 'ne');
    }
    notifyListeners();
  }
}
