import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../widgets/wave_animation.dart';

/// Screen that displays and plays the generated lecture with interactive features
class LectureScreen extends StatefulWidget {
  /// Full text of the lecture to be read
  final String lectureText;

  /// Title of the lecture
  final String lectureTitle;

  const LectureScreen({
    super.key,
    required this.lectureText,
    required this.lectureTitle,
  });

  @override
  State<LectureScreen> createState() => _LectureScreenState();
}

class _LectureScreenState extends State<LectureScreen> {
  // Control states
  bool _isPlaying = true;
  bool _isListening = false;
  bool _isPaused = false;

  // Lecture progress tracking
  int _currentSentenceIndex = 0;
  List<String> _sentences = [];

  // User question state
  String? _userQuestion;
  String? _aiResponse;

  // Controllers
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Split text into sentences (simple split, a more sophisticated NLP approach would be better)
    _sentences =
        widget.lectureText
            .split(RegExp(r'(?<=[.!?])\s+'))
            .where((s) => s.isNotEmpty)
            .toList();

    // Start lecture playback after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _startLecture();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _startLecture() {
    // This would integrate with the LiveKit audio service in a real implementation
    // For now, we'll simulate progression through sentences with a timer

    // Reset to beginning if we're at the end
    if (_currentSentenceIndex >= _sentences.length) {
      setState(() {
        _currentSentenceIndex = 0;
      });
    }

    setState(() {
      _isPlaying = true;
      _isPaused = false;
    });

    _simulateLectureProgression();
  }

  void _simulateLectureProgression() {
    // This is a simulation of lecture playback
    // In a real app, this would be tied to the actual audio playback progress
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted || !_isPlaying || _isPaused) return;

      setState(() {
        if (_currentSentenceIndex < _sentences.length - 1) {
          _currentSentenceIndex++;
          _scrollToCurrentSentence();
          _simulateLectureProgression();
        } else {
          // End of lecture
          _isPlaying = false;
        }
      });
    });
  }

  void _scrollToCurrentSentence() {
    // Calculate position to scroll to
    int charCount = 0;
    for (int i = 0; i < _currentSentenceIndex; i++) {
      charCount += _sentences[i].length + 1; // +1 for the space
    }

    // Calculate an approximate position in the text
    // This is a simple estimate, would need refinement in a real app
    final textStyle = Theme.of(context).textTheme.bodyLarge!;
    final textSpan = TextSpan(
      text: widget.lectureText.substring(0, charCount),
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );

    // Rough estimate of where to scroll to
    final lineHeight = textStyle.fontSize! * 1.5;
    final estimatedPosition =
        (charCount / 40) * lineHeight; // Assuming ~40 chars per line

    // Scroll to that position
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        estimatedPosition,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _pauseResumePlayback() {
    setState(() {
      _isPaused = !_isPaused;

      if (!_isPaused) {
        _simulateLectureProgression();
      }
    });
  }

  void _listenForQuestion() {
    // This would activate the speech recognition in a real app
    setState(() {
      _isListening = true;
      _isPaused = true;
    });

    // Simulate receiving a question after a delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _userQuestion = "What are the main points of this lecture?";
          _isListening = false;

          // Simulate AI responding
          Future.delayed(const Duration(seconds: 1), () {
            if (mounted) {
              setState(() {
                _aiResponse =
                    "The main points of this lecture are the key concepts explained in the first three paragraphs. It covers the fundamental ideas and their applications.";

                // Auto-resume after a delay
                Future.delayed(
                  Duration(seconds: AppConstants.AUTO_RESUME_DELAY_SECONDS),
                  () {
                    if (mounted) {
                      setState(() {
                        _userQuestion = null;
                        _aiResponse = null;
                        _isPaused = false;
                        _simulateLectureProgression();
                      });
                    }
                  },
                );
              });
            }
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lectureTitle),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Would navigate to lecture settings (speed, voice, etc.)
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Audio indicator with waves
          Container(
            height: 80,
            color: AppTheme.primaryColor.withOpacity(0.1),
            child: WaveAnimation(
              isActive: _isPlaying && !_isPaused && !_isListening,
              intensity: 0.6,
              color: AppTheme.primaryColor,
              waveCount: 3,
            ),
          ),

          // Question mode overlay
          if (_isListening || _userQuestion != null || _aiResponse != null)
            _buildQuestionOverlay(),

          // Main lecture text area
          Expanded(child: _buildLectureTextArea()),

          // Bottom controls
          _buildBottomControls(),
        ],
      ),
    );
  }

  Widget _buildLectureTextArea() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              height: 1.5,
              color: AppTheme.textDark,
            ),
            children: [
              for (int i = 0; i < _sentences.length; i++)
                TextSpan(
                  text: '${_sentences[i]} ',
                  style: TextStyle(
                    color:
                        i == _currentSentenceIndex
                            ? AppTheme.primaryColor
                            : AppTheme.textDark,
                    fontWeight:
                        i == _currentSentenceIndex
                            ? FontWeight.bold
                            : FontWeight.normal,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionOverlay() {
    return Container(
      width: double.infinity,
      color: Colors.black.withOpacity(0.05),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Listening state
          if (_isListening)
            Column(
              children: [
                Text(
                  AppConstants.LISTENING_TEXT,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 40,
                  child: WaveAnimation(
                    isActive: true,
                    intensity: 0.8,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ],
            ),

          // User question
          if (_userQuestion != null && !_isListening)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                _userQuestion!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),

          const SizedBox(height: 8),

          // AI response
          if (_aiResponse != null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _aiResponse!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _userQuestion = null;
                            _aiResponse = null;
                            _isPaused = false;
                            _simulateLectureProgression();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 36),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                        child: Text(AppConstants.RESUME_LECTURE_TEXT),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomControls() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Playback controls
          Row(
            children: [
              IconButton(
                icon: Icon(
                  _isPaused ? Icons.play_arrow : Icons.pause,
                  color: AppTheme.primaryColor,
                  size: 32,
                ),
                onPressed: _pauseResumePlayback,
              ),
              IconButton(
                icon: const Icon(Icons.replay_10, color: AppTheme.textMedium),
                onPressed: () {
                  // Go back 10 seconds or to the previous sentence
                  setState(() {
                    if (_currentSentenceIndex > 0) {
                      _currentSentenceIndex--;
                      _scrollToCurrentSentence();
                    }
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.forward_10, color: AppTheme.textMedium),
                onPressed: () {
                  // Go forward 10 seconds or to the next sentence
                  setState(() {
                    if (_currentSentenceIndex < _sentences.length - 1) {
                      _currentSentenceIndex++;
                      _scrollToCurrentSentence();
                    }
                  });
                },
              ),
            ],
          ),

          // Microphone button
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              FloatingActionButton(
                heroTag: null,
                onPressed: _listenForQuestion,
                backgroundColor: AppTheme.primaryColor,
                child: const Icon(Icons.mic, color: Colors.white),
              ),
              // Question tooltip (shown initially)
              if (!_isListening && _userQuestion == null && _aiResponse == null)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    AppConstants.MICROPHONE_TOOLTIP,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
