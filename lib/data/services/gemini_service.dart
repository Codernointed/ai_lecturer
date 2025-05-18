import 'package:dio/dio.dart';
import '../../core/constants/app_constants.dart';

/// Service to interact with the Gemini API
class GeminiService {
  final Dio _dio;

  GeminiService({Dio? dio}) : _dio = dio ?? Dio();

  /// Generate a lecture from the provided notes
  Future<String> generateLecture(String notes, {int maxLength = 1000}) async {
    try {
      // Define the API endpoint
      // Note: Replace with the actual Gemini API endpoint when available
      final endpoint =
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent';
      // Prepare the request payload
      final payload = {
        'contents': [
          {
            'parts': [
              {
                'text':
                    'Create a 5-minute lecture based on the following notes. '
                    'Make it engaging, conversational, and educational. '
                    'Break it down into clear sections with a good introduction and conclusion. '
                    'Notes: $notes',
              },
            ],
          },
        ],
        'generationConfig': {
          'temperature': 0.7,
          'maxOutputTokens': maxLength,
          'topP': 0.8,
          'topK': 40,
        },
      };

      // Add API key to the request
      final queryParams = {'key': AppConstants.GEMINI_API_KEY};

      // Make the API request
      final response = await _dio.post(
        endpoint,
        queryParameters: queryParams,
        data: payload,
      );

      // Parse the response
      if (response.statusCode == 200) {
        final data = response.data;
        // Extract the generated text (structure may vary based on actual Gemini API response format)
        // Adjust based on the actual API response structure
        final generatedText =
            data['candidates'][0]['content']['parts'][0]['text'];
        return generatedText ?? 'No lecture was generated.';
      } else {
        throw Exception('Failed to generate lecture: ${response.statusCode}');
      }
    } catch (e) {
      print('Error generating lecture: $e');
      // Return a fallback message if API call fails
      return 'Failed to generate lecture. Please check your internet connection and try again.';
    }
  }

  /// Generate an answer to a user's question about the lecture
  Future<String> generateAnswer(String lectureText, String question) async {
    try {
      // Define the API endpoint
      // Note: Replace with the actual Gemini API endpoint when available
      final endpoint =
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent';

      // Prepare the request payload
      final payload = {
        'contents': [
          {
            'parts': [
              {
                'text':
                    'The following is a lecture: "$lectureText" '
                    'A student has asked this question about the lecture: "$question" '
                    'Provide a concise, helpful answer based only on information in the lecture. '
                    'If the question cannot be answered from the lecture content, say so politely.',
              },
            ],
          },
        ],
        'generationConfig': {
          'temperature': 0.2, // Lower temperature for more factual responses
          'maxOutputTokens': 300, // Shorter responses for Q&A
          'topP': 0.95,
          'topK': 40,
        },
      };

      // Add API key to the request
      final queryParams = {'key': AppConstants.GEMINI_API_KEY};

      // Make the API request
      final response = await _dio.post(
        endpoint,
        queryParameters: queryParams,
        data: payload,
      );

      // Parse the response
      if (response.statusCode == 200) {
        final data = response.data;
        // Extract the generated answer (structure may vary based on actual Gemini API response format)
        // Adjust based on the actual API response structure
        final answer = data['candidates'][0]['content']['parts'][0]['text'];
        return answer ?? 'I couldn\'t find an answer to that question.';
      } else {
        throw Exception('Failed to generate answer: ${response.statusCode}');
      }
    } catch (e) {
      print('Error generating answer: $e');
      // Return a fallback message if API call fails
      return 'I\'m sorry, I couldn\'t process your question right now. Please try again later.';
    }
  }
}
