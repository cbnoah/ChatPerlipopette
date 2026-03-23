import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _IntroductionSection(context: context),
              const SizedBox(height: 30),
              _SectionTitle(title: 'Pour les familles', context: context),
              const SizedBox(height: 10),
              _FamilyCategoryCarousel(context: context),
              const SizedBox(height: 20),
              _SectionTitle(title: 'Calmes & Affectueux', context: context),
              const SizedBox(height: 10),
              _CalmCategorySection(context: context),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Découvrez nos coups de coeur',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onInverseSurface,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}

class _IntroductionSection extends StatelessWidget {
  final BuildContext context;

  const _IntroductionSection({required this.context});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Trouvez le compagnon idéal selon votre style de vie.',
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        fontSize: 15,
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final BuildContext context;

  const _SectionTitle({required this.title, required this.context});

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

class _FamilyCategoryCarousel extends StatelessWidget {
  final BuildContext context;

  const _FamilyCategoryCarousel({required this.context});

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
          _CatCarouselCard(
            name: 'Maine Coon',
            description: 'Le géant doux parfait pour les enfants.',
            imagePath: 'assets/images/Cat.png',
            context: context,
          ),
          _CatCarouselCard(
            name: 'Maine Coon',
            description: 'Le géant doux parfait pour les enfants.',
            imagePath: 'assets/images/Cat.png',
            context: context,
          ),
          _CatCarouselCard(
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

class _CatCarouselCard extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;
  final BuildContext context;

  const _CatCarouselCard({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 180,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onInverseSurface,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'En savoir plus',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CalmCategorySection extends StatelessWidget {
  final BuildContext context;

  const _CalmCategorySection({required this.context});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CatHorizontalCard(
          name: 'Scottish Fold',
          description: 'Un tempérament paisible et indépendant.',
          imagePath: 'assets/images/Cat2.png',
          context: context,
        ),
        const SizedBox(height: 10),
        _CatHorizontalCard(
          name: 'Persan',
          description: 'La quintessence du chat de salon',
          imagePath: 'assets/images/Cat3.png',
          context: context,
        ),
      ],
    );
  }
}

class _CatHorizontalCard extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;
  final BuildContext context;

  const _CatHorizontalCard({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onInverseSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Theme.of(context).colorScheme.onSurface,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Découvrir',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
