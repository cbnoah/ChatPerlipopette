import 'package:flutter/material.dart';
import 'cat_carousel_card.dart';

class FamilyCategoryCarousel extends StatelessWidget {
  final BuildContext context;

  const FamilyCategoryCarousel({required this.context});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: CarouselView(
        scrollDirection: Axis.horizontal,
        itemExtent: 250,
        shrinkExtent: 250,
        itemSnapping: true,
        children: [
          CatCarouselCard(
            name: 'Maine Coon',
            description: 'Le géant doux parfait pour les enfants.',
            imagePath: 'assets/images/Cat.png',
            context: context,
          ),
          CatCarouselCard(
            name: 'Maine Coon',
            description: 'Le géant doux parfait pour les enfants.',
            imagePath: 'assets/images/Cat.png',
            context: context,
          ),
          CatCarouselCard(
            name: 'Maine Coon',
            description: 'Le géant doux parfait pour les enfants.',
            imagePath: 'assets/images/Cat.png',
            context: context,
          ),
        ],
      ),
    );
  }
}

