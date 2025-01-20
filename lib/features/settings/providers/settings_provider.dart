// lib/features/settings/providers/settings_provider.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  String _language = 'en';
  bool _visualNotifications = true;
  bool _soundNotifications = true;

  bool get isDarkMode => _isDarkMode;
  String get language => _language;
  bool get visualNotifications => _visualNotifications;
  bool get soundNotifications => _soundNotifications;

  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _language = prefs.getString('language') ?? 'en';
    _visualNotifications = prefs.getBool('visualNotifications') ?? true;
    _soundNotifications = prefs.getBool('soundNotifications') ?? true;
    notifyListeners();
  }

  Future<void> setDarkMode(bool value) async {
    _isDarkMode = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
    notifyListeners();
  }

  Future<void> setLanguage(String value) async {
    _language = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', value);
    notifyListeners();
  }

  Future<void> setVisualNotifications(bool value) async {
    _visualNotifications = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('visualNotifications', value);
    notifyListeners();
  }

  Future<void> setSoundNotifications(bool value) async {
    _soundNotifications = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('soundNotifications', value);
    notifyListeners();
  }
}