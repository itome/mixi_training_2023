import 'package:flutter/material.dart';
import 'package:mixi_training_2023/models/message.dart';
import 'package:mixi_training_2023/repositories/chart_repository.dart';
import 'package:mixi_training_2023/widgets/assistant_message_bubble.dart';
import 'package:mixi_training_2023/widgets/system_message_bubble.dart';
import 'package:mixi_training_2023/widgets/user_message_bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  final _controller = TextEditingController();
  final _chatRepository = ChatRepository();
  List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadInitialMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat with OpenAI')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
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

  Future<void> _loadInitialMessages() async {
    final initialMessages = [
      Message(
        role: MessageRole.system,
        content: '学校の先生として答えてください',
      ),
    ];
    setState(() {
      _messages = initialMessages;
    });
    final response = await _chatRepository.getChatCompletions(initialMessages);
    setState(() {
      _messages = [
        ...response.choices.map((choice) => choice.message),
        ...initialMessages,
      ];
    });
  }

  Future<void> _sendMessage() async {
    final text = _controller.text;
    _controller.clear();
    setState(() {
      _messages = [
        Message(role: MessageRole.user, content: text),
        ..._messages,
      ];
    });
    final response = await _chatRepository.getChatCompletions(_messages);
    setState(() {
      _messages = [
        ...response.choices.map((choice) => choice.message),
        ..._messages,
      ];
    });
  }
}
