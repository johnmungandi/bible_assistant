
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GroqAPI {
  static String? apiKey = dotenv.env['GROQ_API_KEY'];
  static const String baseUrl = 'https://api.groq.com/v1/chat/completions';

  static Future<String> generateResponse(String prompt) async {
    if (apiKey == null) {
      throw Exception('GROQ_API_KEY not found in environment variables');
    }

    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'mixtral-8x7b-32768',
          'messages': [
            {
              'role': 'user',
              'content': prompt,
            }
          ],
          'temperature': 0.7,
          'max_tokens': 1024,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        throw Exception('Failed to generate response: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error generating response: $e');
    }
  }
}
