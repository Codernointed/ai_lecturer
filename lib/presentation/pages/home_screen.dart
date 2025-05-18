import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../widgets/wave_animation.dart';
import 'notes_input_screen.dart';
import 'past_lectures_screen.dart';

/// Home screen of the app, the entry point for users
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with subtle waves
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    AppTheme.primaryColor.withOpacity(0.1),
                  ],
                ),
              ),
              child: WaveAnimation(
                isActive: true,
                intensity: 0.3,
                isSubtle: true,
                waveCount: 5,
                animationDuration: 3000,
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // App logo/icon (if you have one)
                    // Image.asset('assets/images/logo.png', height: 80),

                    // App title
                    Text(
                      AppConstants.APP_NAME,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineLarge?.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 12),

                    // App tagline
                    Text(
                      AppConstants.APP_TAGLINE,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppTheme.textMedium,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 64),

                    // Start New Lecture button
                    ElevatedButton(
                      onPressed: () => _navigateToNotesInputScreen(context),
                      child: Text(AppConstants.START_LECTURE_TEXT),
                    ),

                    const SizedBox(height: 16),

                    // View Past Lectures button
                    OutlinedButton(
                      onPressed: () => _navigateToPastLecturesScreen(context),
                      child: Text(AppConstants.VIEW_PAST_LECTURES_TEXT),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToNotesInputScreen(BuildContext context) {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const NotesInputScreen()),
    );
  }

  void _navigateToPastLecturesScreen(BuildContext context) {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const PastLecturesScreen()),
    );
  }
}
