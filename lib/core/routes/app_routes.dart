import 'package:flutter/material.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/register_screen.dart';
import '../../features/medications/screens/medication_list_screen.dart';
import '../../features/medications/screens/add_medication_screen.dart';
import '../../features/prescriptions/screens/prescription_list_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String medications = '/medications';
  static const String addMedication = '/add-medication';
  static const String prescriptions = '/prescriptions';
  static const String settings = '/settings';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case medications:
        return MaterialPageRoute(builder: (_) => const MedicationListScreen());
      case addMedication:
        return MaterialPageRoute(builder: (_) => const AddMedicationScreen());
      case prescriptions:
        return MaterialPageRoute(builder: (_) => const PrescriptionListScreen());
      case settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}