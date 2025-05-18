import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../../data/services/gemini_service.dart';
import '../../data/services/livekit_service.dart';

/// Singleton instance of GetIt
final GetIt locator = GetIt.instance;

/// Setup the service locator with all dependencies
void setupServiceLocator() {
  // Register third-party services
  locator.registerLazySingleton<Dio>(() => Dio());

  // Register app services
  locator.registerLazySingleton<GeminiService>(
    () => GeminiService(dio: locator<Dio>()),
  );
  locator.registerLazySingleton<LiveKitService>(() => LiveKitService());

  // Register other dependencies as needed
}
