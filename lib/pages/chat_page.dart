import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mixi_training_2023/models/message.dart';
import 'package:mixi_training_2023/providers/messages_provider.dart';
import 'package:mixi_training_2023/widgets/assistant_message_bubble.dart';
import 'package:mixi_training_2023/widgets/system_message_bubble.dart';
import 'package:mixi_training_2023/widgets/user_message_bubble.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends ConsumerState<ChatPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(messagesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Chat with OpenAI')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: state.value?.length ?? 0,
                itemBuilder: (context, index) {
                  final message = state.value![index];
                  switch (message.role) {
                    case MessageRole.system:
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: SystemMessageBubble(content: message.content),
                      );
                    case MessageRole.user:
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: UserMessageBubble(content: message.content),
                      );
                    case MessageRole.assistant:
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: AssistantMessageBubble(content: message.content),
                      );
                  }
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Theme.of(context).dividerColor),
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        hintText: 'Enter a message',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendMessage() async {
    final text = _controller.text;
    _controller.clear();
    await ref.read(messagesProvider.notifier).sendMessage(text);
  }
}
