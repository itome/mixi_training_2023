import 'package:flutter/material.dart';

class AssistantMessageBubble extends StatelessWidget {
  final String content;

  const AssistantMessageBubble({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(
          left: 16,
          right: 64,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text(
          content,
          style: Theme.of(context)
              .primaryTextTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
