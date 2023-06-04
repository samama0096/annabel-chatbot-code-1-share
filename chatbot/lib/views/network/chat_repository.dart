import 'dart:convert';

import '../utils/constant.dart';
import 'package:http/http.dart' as http;

Future<dynamic> generateResponse(String prompt, String cat) async {
  const apiKey = apiSecretKey;

  var url = Uri.https("api.openai.com", "/v1/chat/completions");
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      "Authorization":
          "Bearer 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"
    },
    body: json.encode({
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "system",
          "content": "System name is Annabel. Discussing about $cat"
        },
        {"role": "user", "content": prompt}
      ],
      'temperature': 0,
      'max_tokens': 2000,
      'top_p': 1,
      'frequency_penalty': 0.0,
      'presence_penalty': 0.0,
    }),
  );

  // Do something with the response
  Map<String, dynamic> newresponse = jsonDecode(response.body);
  print(newresponse['choices'][0]['message']['content']);

  return newresponse['choices'][0]['message']['content'];
}

Future<dynamic> generateResponse2(
  String prompt,
) async {
  const apiKey = apiSecretKey;

  var url = Uri.https("api.openai.com", "/v1/chat/completions");
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      "Authorization":
          "Bearer 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"
    },
    body: json.encode({
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "system",
          "content":
              "You are a chatbot which respond to a human about their questions."
        },
        {"role": "user", "content": prompt}
      ],
      'temperature': 0,
      'max_tokens': 2000,
      'top_p': 1,
      'frequency_penalty': 0.0,
      'presence_penalty': 0.0,
    }),
  );

  // Do something with the response
  Map<String, dynamic> newresponse = jsonDecode(response.body);
  print(newresponse['choices'][0]['message']['content']);

  return newresponse['choices'][0]['message']['content'];
}
