import 'dart:convert';

import 'package:mixi_training_2023/models/message.dart';
import 'package:mixi_training_2023/models/response.dart';
import 'package:http/http.dart' as http;

const apiKey = String.fromEnvironment('OPENAI_API_KEY');

class ChatRepository {
  Future<Response> getChatCompletions(
    List<Message> messages,
  ) async {
    final uri = Uri(
      scheme: 'https',
      host: "api.openai.com",
      path: "v1/chat/completions",
    );
    final response = await http.post(
      uri,
      body: json.encode({
        "model": "gpt-3.5-turbo",
        "messages": messages.map((e) => e.toJson()).toList(),
      }),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey"
      },
    );

    return Response.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  }
}
