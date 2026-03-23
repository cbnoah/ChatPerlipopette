import 'package:flutter/material.dart';
import '../utils/cat.dart';
import 'cat_attribute_card.dart';

class CatAttributesSection extends StatelessWidget {
  final Cat cat;

  const CatAttributesSection({required this.cat});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 5.0,
      children: [
        CatAttributeCard(
          emoji: '❤︎',
          label: 'Affection',
          value: '${cat.affectionLevel}/5',
        ),
        CatAttributeCard(
          emoji: '⚡︎',
          label: 'Énergie',
          value: '${cat.energyLevel}/5',
        ),
        CatAttributeCard(
          emoji: '🧠',
          label: 'Intelligence',
          value: '${cat.intelligence}/5',
        ),
      ],
    );
  }
}

