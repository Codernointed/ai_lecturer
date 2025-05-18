import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'core/constants/app_constants.dart';
// import 'core/di/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'presentation/pages/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Setup dependency injection
  // setupServiceLocator();
  
  // Request necessary permissions
  // await _requestPermissions();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(const DrLecturerApp());
}

/// Request necessary permissions for the app to function properly
/*
Future<void> _requestPermissions() async {
  await Permission.microphone.request();
  await Permission.storage.request();
  
  // For Android, request bluetooth permissions if needed for audio routing
  if (await Permission.bluetooth.isSupported) {
    await Permission.bluetooth.request();
  }
  
  if (await Permission.bluetoothConnect.isSupported) {
    await Permission.bluetoothConnect.request();
  }
}
*/

/// Main application widget
class DrLecturerApp extends StatefulWidget {
  const DrLecturerApp({super.key});

  @override
  State<DrLecturerApp> createState() => _DrLecturerAppState();
}

class _DrLecturerAppState extends State<DrLecturerApp> {
  // For accessibility, we'll have an option to toggle between themes
  bool _isHighContrastMode = false;
  
  void _toggleHighContrastMode() {
    setState(() {
      _isHighContrastMode = !_isHighContrastMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.APP_NAME,
      theme: _isHighContrastMode ? AppTheme.highContrastTheme : AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      builder: (context, child) {
        // Add an accessibility menu that can be triggered from AppBar or settings
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Banner(
            location: BannerLocation.topEnd,
            message: 'BETA',
            color: AppTheme.secondaryColor,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              letterSpacing: 1.0,
              color: AppTheme.textDark,
            ),
            textDirection: TextDirection.ltr,
            child: child!,
          ),
        );
      },
    );
  }
}
