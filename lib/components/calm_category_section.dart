import 'package:flutter/material.dart';
import 'cat_horizontal_card.dart';

class CalmCategorySection extends StatelessWidget {
  final BuildContext context;

  const CalmCategorySection({required this.context});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CatHorizontalCard(
          name: 'Scottish Fold',
          description: 'Un tempérament paisible et indépendant.',
          imagePath: 'assets/images/Cat2.png',
          context: context,
        ),
        const SizedBox(height: 10),
        CatHorizontalCard(
          name: 'Persan',
          description: 'La quintessence du chat de salon',
          imagePath: 'assets/images/Cat3.png',
          context: context,
        ),
      ],
    );
  }
}

