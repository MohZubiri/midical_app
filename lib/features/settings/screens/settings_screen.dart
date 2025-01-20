// lib/features/settings/screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences.dart';
import '../../../core/routes/app_routes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;
  String _selectedLanguage = 'en';
  bool _visualNotifications = true;
  bool _soundNotifications = true;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
      _selectedLanguage = prefs.getString('language') ?? 'en';
      _visualNotifications = prefs.getBool('visualNotifications') ?? true;
      _soundNotifications = prefs.getBool('soundNotifications') ?? true;
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
    await prefs.setString('language', _selectedLanguage);
    await prefs.setBool('visualNotifications', _visualNotifications);
    await prefs.setBool('soundNotifications', _soundNotifications);
  }

  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error signing out: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // User Profile Section
          ListTile(
            leading: CircleAvatar(
              child: Text(
                user?.email?.substring(0, 1).toUpperCase() ?? 'U',
              ),
            ),
            title: Text(user?.email ?? 'User'),
            subtitle: const Text('Tap to edit profile'),
            onTap: () {
              // TODO: Implement profile editing
            },
          ),
          const Divider(),

          // Theme Settings
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Enable dark theme'),
            value: _isDarkMode,
            onChanged: (value) {
              setState(() {
                _isDarkMode = value;
                _savePreferences();
              });
            },
          ),

          // Language Settings
          ListTile(
            title: const Text('Language'),
            subtitle: Text(_selectedLanguage == 'en' ? 'English' : 'العربية'),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              items: const [
                DropdownMenuItem(
                  value: 'en',
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: 'ar',
                  child: Text('العربية'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedLanguage = value;
                    _savePreferences();
                  });
                }
              },
            ),
          ),

          // Notification Settings
          const ListTile(
            title: Text('Notification Settings'),
            subtitle: Text('Customize your alerts'),
          ),
          SwitchListTile(
            title: const Text('Visual Notifications'),
            subtitle: const Text('Show notification banners'),
            value: _visualNotifications,
            onChanged: (value) {
              setState(() {
                _visualNotifications = value;
                _savePreferences();
              });
            },
          ),
          SwitchListTile(
            title: const Text('Sound Notifications'),
            subtitle: const Text('Play notification sounds'),
            value: _soundNotifications,
            onChanged: (value) {
              setState(() {
                _soundNotifications = value;
                _savePreferences();
              });
            },
          ),

          const Divider(),

          // Account Actions
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Change Password'),
            onTap: () {
              // TODO: Implement password change
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Sign Out',
              style: TextStyle(color: Colors.red),
            ),
            onTap: _signOut,
          ),

          // App Info
          const Divider(),
          const ListTile(
            title: Text('About'),
            subtitle: Text('Medication Reminder v1.0.0'),
          ),
        ],
      ),
    );
  }
}