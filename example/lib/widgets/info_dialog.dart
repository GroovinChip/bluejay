import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
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
    return SimpleDialog(
      title: const Text('Author'),
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              authorAvatarUrl,
            ),
          ),
          title: Text(authorName),
        ),
        ButtonBar(
          children: [
            TextButton(
              child: const Text('VIEW SOURCE'),
              onPressed: () async {
                if (await canLaunchUrl(Uri.parse(sourceUrl))) {
                  await launchUrl(Uri.parse(sourceUrl));
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
