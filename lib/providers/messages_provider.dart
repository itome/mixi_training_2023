import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mixi_training_2023/models/message.dart';
import 'package:mixi_training_2023/providers/chat_repository_provider.dart';

final messagesProvider = AsyncNotifierProvider<MessagesProvider, List<Message>>(
  MessagesProvider.new,
);

class MessagesProvider extends AsyncNotifier<List<Message>> {
  @override
  Future<List<Message>> build() async {
    final initialMessages = [
      Message(
        role: MessageRole.system,
        content: '学校の先生として答えてください',
      ),
    ];
    final response = await ref
        .read(chatRepositoryProvider)
        .getChatCompletions(initialMessages);
    return [
      ...response.choices.map((choice) => choice.message),
      ...initialMessages,
    ];
  }

  Future<void> sendMessage(String text) async {
    state = state.maybeWhen(
      data: (messages) => AsyncData(
        [
          Message(role: MessageRole.user, content: text),
          ...messages,
        ],
      ),
      orElse: () => state,
    );

    try {
      final response = await ref
          .read(chatRepositoryProvider)
          .getChatCompletions(state.value ?? []);
      state = state.maybeWhen(
        data: (messages) => AsyncData(
          [
            ...response.choices.map((choice) => choice.message),
            ...messages,
          ],
        ),
        orElse: () => state,
      );
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
