import 'dart:async';
import 'package:livekit_client/livekit_client.dart';
import '../../core/constants/app_constants.dart';

/// Service to manage LiveKit interactions for audio streaming and processing
class LiveKitService {
  Room? _room;
  EventsListener<RoomEvent>? _roomListener;
  bool _isConnected = false;

  /// Get the current connection status
  bool get isConnected => _isConnected;

  /// Get the current room instance
  Room? get room => _room;

  /// Connect to a LiveKit room
  Future<Room> connect({
    String? customRoomName,
    String? customParticipantName,
  }) async {
    if (_isConnected) {
      return _room!;
    }

    try {
      // Create a new room instance
      _room = Room();

      // Set up listener for room events
      _roomListener = _room!.createListener();

      // Generate a room name if not provided
      final roomName =
          customRoomName ?? 'lecture_${DateTime.now().millisecondsSinceEpoch}';

      // Generate a participant name if not provided
      final participantName =
          customParticipantName ??
          'user_${DateTime.now().millisecondsSinceEpoch}';

      // Configure room options
      final roomOptions = RoomOptions(
        adaptiveStream: true,
        dynacast: true,
        // Default audio only, since we're primarily focused on lectures
        defaultAudioPublishOptions: const AudioPublishOptions(
          name: 'user_audio',
          dtx: true,
          // priority: TrackPublishPriority.high,
        ),
      );

      // Create JWT token for this room (in a real app, this would come from your server)
      // For this example, we're assuming you'll set the LiveKit URL and API key/secret in AppConstants

      // Connect to the room
      final url = AppConstants.LIVEKIT_URL;

      // In a production app, you'd generate this token on your server
      // For testing, we'll need to insert the token directly
      final token = "t4EKqW6IWqiQd1Oex0lhXIezQ4fWcs6JUnfafLTslyPF"; // This is a placeholder

      await _room!.connect(url, token, roomOptions: roomOptions);

      _isConnected = true;
      return _room!;
    } catch (e) {
      print('Error connecting to LiveKit: $e');
      throw Exception('Failed to connect to LiveKit: $e');
    }
  }

  /// Disconnect from the current room
  Future<void> disconnect() async {
    if (!_isConnected || _room == null) {
      return;
    }

    try {
      await _room!.disconnect();
      _roomListener?.dispose();
      _roomListener = null;
      _isConnected = false;
    } catch (e) {
      print('Error disconnecting from LiveKit: $e');
      throw Exception('Failed to disconnect from LiveKit: $e');
    }
  }

  /// Enable/disable microphone
  Future<void> setMicrophoneEnabled(bool enabled) async {
    if (!_isConnected || _room == null) {
      throw Exception('Not connected to a room');
    }

    try {
      await _room!.localParticipant!.setMicrophoneEnabled(enabled);
    } catch (e) {
      print('Error toggling microphone: $e');
      throw Exception('Failed to toggle microphone: $e');
    }
  }

  /// Listen to room events
  void listenToEvents(void Function(RoomEvent event) onEvent) {
    _roomListener?.on<RoomEvent>((event) {
      onEvent(event);
    });
  }

  /// Dispose resources
  void dispose() {
    disconnect();
  }
}
