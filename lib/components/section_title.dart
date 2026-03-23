import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final BuildContext context;

  const SectionTitle({required this.title, required this.context});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onInverseSurface,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

