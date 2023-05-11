import 'package:flutter/material.dart';

class UserMessageBubble extends StatelessWidget {
  final String content;

  const UserMessageBubble({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(
          left: 64,
          right: 16,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text(
          content,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
