import 'package:flutter/material.dart';
import 'package:shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  static const String LANGUAGE_CODE = 'languageCode';
  
  Locale _currentLocale = const Locale('en', '');
  final SharedPreferences? _prefs;

  LanguageProvider([this._prefs]) {
    _loadSavedLanguage();
  }

  Locale get currentLocale => _currentLocale;

  Future<void> _loadSavedLanguage() async {
    if (_prefs != null) {
      String? languageCode = _prefs!.getString(LANGUAGE_CODE);
      if (languageCode != null) {
        _currentLocale = Locale(languageCode, '');
        notifyListeners();
      }
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    if (languageCode == _currentLocale.languageCode) return;

    _currentLocale = Locale(languageCode, '');
    if (_prefs != null) {
      await _prefs!.setString(LANGUAGE_CODE, languageCode);
    }
    notifyListeners();
  }

  bool isEnglish() => _currentLocale.languageCode == 'en';
  bool isArabic() => _currentLocale.languageCode == 'ar';

  TextDirection get textDirection =>
      isArabic() ? TextDirection.rtl : TextDirection.ltr;
}