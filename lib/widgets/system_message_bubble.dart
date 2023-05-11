import 'package:flutter/material.dart';

class SystemMessageBubble extends StatelessWidget {
  final String content;

  const SystemMessageBubble({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Text(
          content,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
