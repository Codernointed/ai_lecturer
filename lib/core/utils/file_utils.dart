import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

/// Utility class for handling file operations related to lecture note files
class FileUtils {
  /// Allowed file extensions
  static const List<String> allowedExtensions = ['pdf', 'txt', 'docx'];

  /// Pick a file from device storage
  static Future<File?> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
      );

      if (result != null) {
        return File(result.files.single.path!);
      }
      return null;
    } catch (e) {
      print('Error picking file: $e');
      return null;
    }
  }

  /// Extract text content from a file based on its type
  static Future<String?> extractTextFromFile(File file) async {
    try {
      String extension = file.path.split('.').last.toLowerCase();

      switch (extension) {
        case 'txt':
          return await file.readAsString();

        case 'pdf':
          final bytes = await file.readAsBytes();
          final document = PdfDocument(inputBytes: bytes);
          final PdfTextExtractor extractor = PdfTextExtractor(document);
          final String text = extractor.extractText();
          document.dispose();
          return text;

        // For other file types, we'd need additional parsing logic
        default:
          return null;
      }
    } catch (e) {
      print('Error extracting text from file: $e');
      return null;
    }
  }

  /// Save lecture text to a local file for history/future reference
  static Future<File> saveLectureText(String lectureText, String title) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final sanitizedTitle = title
          .replaceAll(RegExp(r'[^\w\s]+'), '')
          .replaceAll(' ', '_');

      // Create a filename with timestamp to ensure uniqueness
      String filename = '${sanitizedTitle}_$timestamp.txt';
      final file = File('$path/$filename');

      // Write to file
      return await file.writeAsString(lectureText);
    } catch (e) {
      print('Error saving lecture text: $e');
      throw Exception('Failed to save lecture text');
    }
  }

  /// List saved lecture files
  static Future<List<Map<String, dynamic>>> getSavedLectures() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;

      // Get all text files
      final dir = Directory(path);
      List<FileSystemEntity> files = dir.listSync();

      // Filter for our lecture files
      List<Map<String, dynamic>> lectureFiles = [];

      for (var file in files) {
        if (file.path.endsWith('.txt')) {
          String filename = file.path.split('/').last;

          // Extract title and timestamp from filename
          List<String> parts = filename.split('_');
          String title = '';
          String timestamp = '';

          if (parts.length > 1) {
            // Last part is the timestamp
            timestamp = parts.last.split('.').first;
            // Everything before is the title
            title = parts
                .sublist(0, parts.length - 1)
                .join('_')
                .replaceAll('_', ' ');
          } else {
            title = parts[0];
          }

          DateTime? creationDate;
          try {
            int timestampInt = int.parse(timestamp);
            creationDate = DateTime.fromMillisecondsSinceEpoch(timestampInt);
          } catch (e) {
            creationDate = await File(file.path).lastModified();
          }

          lectureFiles.add({
            'path': file.path,
            'title': title,
            'creationDate': creationDate,
          });
        }
      }

      // Sort by creation date, newest first
      lectureFiles.sort(
        (a, b) => (b['creationDate'] as DateTime).compareTo(
          a['creationDate'] as DateTime,
        ),
      );

      return lectureFiles;
    } catch (e) {
      print('Error getting saved lectures: $e');
      return [];
    }
  }
}
