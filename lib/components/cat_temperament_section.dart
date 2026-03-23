import 'package:flutter/material.dart';
import '../utils/cat.dart';

class CatTemperamentSection extends StatelessWidget {
  final Cat cat;

  const CatTemperamentSection({required this.cat});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tempérament',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onInverseSurface,
          ),
        ),
        SizedBox(height: 12),
        Text(
          cat.description,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

