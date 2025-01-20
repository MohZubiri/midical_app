import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_name': 'Medication Reminder',
      'login': 'Login',
      'register': 'Register',
      'email': 'Email',
      'password': 'Password',
      'forgot_password': 'Forgot Password?',
      'medications': 'Medications',
      'add_medication': 'Add Medication',
      'medication_name': 'Medication Name',
      'dosage': 'Dosage',
      'instructions': 'Instructions',
      'expiration_date': 'Expiration Date',
      'stock': 'Stock',
      'schedule': 'Schedule',
      'notifications': 'Notifications',
      'settings': 'Settings',
      'language': 'Language',
      'theme': 'Theme',
      'dark_mode': 'Dark Mode',
      'light_mode': 'Light Mode',
      'profile': 'Profile',
      'logout': 'Logout',
      'save': 'Save',
      'cancel': 'Cancel',
      'delete': 'Delete',
      'edit': 'Edit',
      'confirm': 'Confirm',
    },
    'ar': {
      'app_name': 'مذكر الدواء',
      'login': 'تسجيل الدخول',
      'register': 'تسجيل',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة المرور',
      'forgot_password': 'نسيت كلمة المرور؟',
      'medications': 'الأدوية',
      'add_medication': 'إضافة دواء',
      'medication_name': 'اسم الدواء',
      'dosage': 'الجرعة',
      'instructions': 'التعليمات',
      'expiration_date': 'تاريخ انتهاء الصلاحية',
      'stock': 'المخزون',
      'schedule': 'الجدول',
      'notifications': 'الإشعارات',
      'settings': 'الإعدادات',
      'language': 'اللغة',
      'theme': 'المظهر',
      'dark_mode': 'الوضع الداكن',
      'light_mode': 'الوضع الفاتح',
      'profile': 'الملف الشخصي',
      'logout': 'تسجيل الخروج',
      'save': 'حفظ',
      'cancel': 'إلغاء',
      'delete': 'حذف',
      'edit': 'تعديل',
      'confirm': 'تأكيد',
    },
  };

  String get appName => _localizedValues[locale.languageCode]!['app_name']!;
  String get login => _localizedValues[locale.languageCode]!['login']!;
  String get register => _localizedValues[locale.languageCode]!['register']!;
  String get email => _localizedValues[locale.languageCode]!['email']!;
  String get password => _localizedValues[locale.languageCode]!['password']!;
  String get forgotPassword => _localizedValues[locale.languageCode]!['forgot_password']!;
  String get medications => _localizedValues[locale.languageCode]!['medications']!;
  String get addMedication => _localizedValues[locale.languageCode]!['add_medication']!;
  String get medicationName => _localizedValues[locale.languageCode]!['medication_name']!;
  String get dosage => _localizedValues[locale.languageCode]!['dosage']!;
  String get instructions => _localizedValues[locale.languageCode]!['instructions']!;
  String get expirationDate => _localizedValues[locale.languageCode]!['expiration_date']!;
  String get stock => _localizedValues[locale.languageCode]!['stock']!;
  String get schedule => _localizedValues[locale.languageCode]!['schedule']!;
  String get notifications => _localizedValues[locale.languageCode]!['notifications']!;
  String get settings => _localizedValues[locale.languageCode]!['settings']!;
  String get language => _localizedValues[locale.languageCode]!['language']!;
  String get theme => _localizedValues[locale.languageCode]!['theme']!;
  String get darkMode => _localizedValues[locale.languageCode]!['dark_mode']!;
  String get lightMode => _localizedValues[locale.languageCode]!['light_mode']!;
  String get profile => _localizedValues[locale.languageCode]!['profile']!;
  String get logout => _localizedValues[locale.languageCode]!['logout']!;
  String get save => _localizedValues[locale.languageCode]!['save']!;
  String get cancel => _localizedValues[locale.languageCode]!['cancel']!;
  String get delete => _localizedValues[locale.languageCode]!['delete']!;
  String get edit => _localizedValues[locale.languageCode]!['edit']!;
  String get confirm => _localizedValues[locale.languageCode]!['confirm']!;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}