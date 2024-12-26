import 'dart:convert';

import 'package:http/http.dart' as http;

String apiKey = const String.fromEnvironment('GROQ_API_KEY');
List<String> models = [];
void main() async {
  final url = Uri.parse('https://api.groq.com/openai/v1/chat/completions');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${'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'}',
    };
    
    final body = {
      'messages': [
        {
          'role': 'user',
          'content': 'hi'
        }
      ],
      'model': 'llama-3.2-11b-vision-preview',
      'temperature': 0,
      'max_tokens': 8000,
      'top_p': 1,
      'stream': false,
      'stop': null
    };
  
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );
  
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse['choices'][0]['message']['content']);
    } else {
      print('Request failed with status: ${response.statusCode}');

    
    }
  
}