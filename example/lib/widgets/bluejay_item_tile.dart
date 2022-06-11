import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BluejayItemTile extends StatelessWidget {
  const BluejayItemTile({
    super.key,
    required this.name,
    required this.description,
    required this.onTap,
  });

  final String name;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: GoogleFonts.firaCode(),
      ),
      subtitle: Text(description),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
