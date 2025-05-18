import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/file_utils.dart';
import 'lecture_screen.dart';

/// Screen that displays a list of past lectures for user to revisit
class PastLecturesScreen extends StatefulWidget {
  const PastLecturesScreen({super.key});

  @override
  State<PastLecturesScreen> createState() => _PastLecturesScreenState();
}

class _PastLecturesScreenState extends State<PastLecturesScreen> {
  List<Map<String, dynamic>> _lectures = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLectures();
  }

  Future<void> _loadLectures() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final lectures = await FileUtils.getSavedLectures();

      setState(() {
        _lectures = lectures;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading lectures: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    }
  }

  Future<void> _openLecture(Map<String, dynamic> lecture) async {
    try {
      final file = await FileUtils.extractTextFromFile(lecture['path']);

      if (file != null && mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => LectureScreen(
                  lectureText: file,
                  lectureTitle: lecture['title'],
                ),
          ),
        );
      } else {
        _showErrorSnackBar('Failed to load lecture content');
      }
    } catch (e) {
      _showErrorSnackBar('Error opening lecture: $e');
    }
  }

  void _showErrorSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: AppTheme.errorColor),
      );
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Lectures'),
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadLectures),
        ],
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _lectures.isEmpty
              ? _buildEmptyState()
              : _buildLecturesList(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history, size: 80, color: AppTheme.textLight),
          const SizedBox(height: 16),
          Text(
            'No past lectures found',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: AppTheme.textMedium),
          ),
          const SizedBox(height: 8),
          Text(
            'Your saved lectures will appear here',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppTheme.textLight),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.add),
            label: const Text('Create a New Lecture'),
          ),
        ],
      ),
    );
  }

  Widget _buildLecturesList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _lectures.length,
      itemBuilder: (context, index) {
        final lecture = _lectures[index];
        final DateTime date = lecture['creationDate'];

        return Card(
          elevation: 1,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () => _openLecture(lecture),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.description,
                        color: AppTheme.primaryColor,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          lecture['title'],
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Created: ${_formatDate(date)}',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(color: AppTheme.textMedium),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        icon: const Icon(Icons.play_arrow, size: 18),
                        label: const Text('Play'),
                        onPressed: () => _openLecture(lecture),
                        style: TextButton.styleFrom(
                          foregroundColor: AppTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
