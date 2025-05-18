// App constants to be used throughout the application
class AppConstants {
  // API URLs & Keys (placeholders that will be replaced with actual values)
  static const String LIVEKIT_URL = 'wss://ai-lecturer-1du51kpp.livekit.cloud';
  static const String LIVEKIT_API_KEY = 'API73o5PsaE6VfS';
  static const String LIVEKIT_API_SECRET = 't4EKqW6IWqiQd1Oex0lhXIezQ4fWcs6JUnfafLTslyPF';
  static const String GEMINI_API_KEY = 'AIzaSyDyhUhn4VrgUBzqZAXPuOgV5m2LQX6xnFc';
  
  // App name
  static const String APP_NAME = 'Dr. Lecturer';
  
  // Tagline
  static const String APP_TAGLINE = 'Turn your notes into engaging lectures!';
  
  // Button text
  static const String START_LECTURE_TEXT = 'Start a New Lecture';
  static const String VIEW_PAST_LECTURES_TEXT = 'View Past Lectures';
  static const String UPLOAD_FILE_TEXT = 'Upload File (.txt, .pdf)';
  static const String GENERATE_LECTURE_TEXT = 'Generate Lecture';
  static const String RESUME_LECTURE_TEXT = 'Resume Lecture';
  
  // Placeholders
  static const String TEXT_AREA_PLACEHOLDER = 'Paste or type your notes here...';
  static const String LISTENING_TEXT = 'Listening...';
  static const String MICROPHONE_TOOLTIP = 'Say \'Doctor L\' to ask a question';
  
  // File formats
  static const List<String> SUPPORTED_FILE_FORMATS = ['.txt', '.pdf', '.docx'];
  
  // Timeouts
  static const int AUTO_RESUME_DELAY_SECONDS = 2;
} 