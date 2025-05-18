import 'dart:io';
import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/file_utils.dart';
import '../widgets/wave_animation.dart';
import 'lecture_screen.dart';

/// Screen for inputting lecture notes, either by file upload or direct text entry
class NotesInputScreen extends StatefulWidget {
  const NotesInputScreen({super.key});

  @override
  State<NotesInputScreen> createState() => _NotesInputScreenState();
}

class _NotesInputScreenState extends State<NotesInputScreen> {
  final TextEditingController _textController = TextEditingController();
  String? _uploadedFilePath;
  String? _uploadedFileName;
  bool _processingFile = false;
  bool _showWaveAnimation = false;
  final int _maxWordCount = 500; // Arbitrary limit for this example
  int _currentWordCount = 0;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_updateWordCount);
  }

  @override
  void dispose() {
    _textController.removeListener(_updateWordCount);
    _textController.dispose();
    super.dispose();
  }

  void _updateWordCount() {
    setState(() {
      // Count words by splitting on whitespace
      final text = _textController.text.trim();
      _currentWordCount = text.isEmpty ? 0 : text.split(RegExp(r'\s+')).length;

      // When text is entered, show the wave animation briefly
      if (text.isNotEmpty && !_showWaveAnimation) {
        _showWaveAnimation = true;
        // Hide the animation after a delay
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            setState(() {
              _showWaveAnimation = false;
            });
          }
        });
      }
    });
  }

  Future<void> _pickFile() async {
    setState(() {
      _processingFile = true;
    });

    try {
      final file = await FileUtils.pickFile();
      if (file != null) {
        // Extract text content from file
        final content = await FileUtils.extractTextFromFile(file);

        if (content != null) {
          setState(() {
            _uploadedFilePath = file.path;
            _uploadedFileName = file.path.split('/').last;
            _textController.text = content;
            _showWaveAnimation = true;

            // Hide the animation after a delay
            Future.delayed(const Duration(seconds: 3), () {
              if (mounted) {
                setState(() {
                  _showWaveAnimation = false;
                });
              }
            });
          });
        } else {
          _showErrorSnackBar('Could not extract text from the file');
        }
      }
    } catch (e) {
      _showErrorSnackBar('Error processing file: $e');
    } finally {
      setState(() {
        _processingFile = false;
      });
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppTheme.errorColor),
    );
  }

  void _generateLecture() {
    if (_textController.text.trim().isEmpty) {
      _showErrorSnackBar('Please enter some notes first');
      return;
    }

    // Navigate to lecture screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LectureScreen(
          lectureText: _textController.text,
          lectureTitle: _uploadedFileName ?? 'My Lecture',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isGenerateButtonEnabled = _textController.text.trim().isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: const Text('New Lecture'), elevation: 0),
      body: Stack(
        children: [
          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Upload file button
                  ElevatedButton.icon(
                    onPressed: _processingFile ? null : _pickFile,
                    icon: const Icon(Icons.upload_file),
                    label: Text(
                      _processingFile
                          ? 'Processing...'
                          : AppConstants.UPLOAD_FILE_TEXT,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.secondaryColor,
                      foregroundColor: AppTheme.textDark,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Uploaded file info (if any)
                  if (_uploadedFileName != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.description,
                            size: 16,
                            color: AppTheme.textMedium,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Uploaded: $_uploadedFileName',
                              style: TextStyle(
                                color: AppTheme.textMedium,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, size: 16),
                            onPressed: () {
                              setState(() {
                                _uploadedFilePath = null;
                                _uploadedFileName = null;
                                _textController.clear();
                              });
                            },
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            splashRadius: 16,
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 8),

                  // Text input area
                  Expanded(
                    child: Stack(
                      children: [
                        // Text area
                        TextField(
                          controller: _textController,
                          maxLines: null,
                          expands: true,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: InputDecoration(
                            hintText: AppConstants.TEXT_AREA_PLACEHOLDER,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppTheme.backgroundLightGray,
                            contentPadding: const EdgeInsets.all(16),
                          ),
                        ),

                        // Wave animation overlay (shown briefly on input)
                        if (_showWaveAnimation)
                          Positioned.fill(
                            child: IgnorePointer(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: WaveAnimation(
                                  isActive: true,
                                  intensity: 0.2,
                                  isSubtle: true,
                                  waveCount: 3,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  // Word count
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      '$_currentWordCount/$_maxWordCount words',
                      style: TextStyle(
                        color:
                            _currentWordCount > _maxWordCount
                                ? AppTheme.errorColor
                                : AppTheme.textMedium,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),

                  // Generate button
                  ElevatedButton(
                    onPressed:
                        isGenerateButtonEnabled ? _generateLecture : null,
                    child: Text(AppConstants.GENERATE_LECTURE_TEXT),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
