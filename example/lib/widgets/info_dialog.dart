import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    Key? key,
    required this.authorName,
    required this.authorAvatarUrl,
    this.authorUrl,
    required this.sourceUrl,
  }) : super(key: key);

  final String authorName;
  final String authorAvatarUrl;
  final String? authorUrl;
  final String sourceUrl;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Author'),
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
              child: Text('VIEW SOURCE'),
              onPressed: () async {
                if (await canLaunch(sourceUrl)) {
                  await launch(sourceUrl);
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
