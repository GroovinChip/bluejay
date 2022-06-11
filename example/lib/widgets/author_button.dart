import 'package:flutter/material.dart';

import 'info_dialog.dart';

class AuthorButton extends StatelessWidget {
  const AuthorButton({
    super.key,
    required this.authorName,
    required this.authorAvatarUrl,
    this.authorUrl,
    required this.sourceUrl,
  });

  final String authorName;
  final String authorAvatarUrl;
  final String? authorUrl;
  final String sourceUrl;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.info_outline),
      onPressed: () => showDialog(
        context: context,
        builder: (_) => InfoDialog(
          authorName: authorName,
          authorAvatarUrl: authorAvatarUrl,
          authorUrl: authorUrl,
          sourceUrl: sourceUrl,
        ),
      ),
    );
  }
}
