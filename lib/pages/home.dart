import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSubtitle(),
              const SizedBox(height: 30),
              _SectionTitle(title: 'Pour les familles'),
              const SizedBox(height: 10),
              _FamilyCatsCarousel(),
              const SizedBox(height: 20),
              _SectionTitle(title: 'Calmes & Affectueux'),
              const SizedBox(height: 10),
              _Calm1CatCard(),
              const SizedBox(height: 10),
              _Calm2CatCard(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        'Découvrez nos coups de coeur',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'Trouvez le compagnon idéal selon votre style de vie.',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15,
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

class _FamilyCatsCarousel extends StatelessWidget {
  const _FamilyCatsCarousel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: CarouselView(
        scrollDirection: Axis.horizontal,
        itemExtent: 250,
        shrinkExtent: 250,
        itemSnapping: true,
        children: const [
          _FamilyCatCard(
            name: 'Maine Coon',
            description: 'Le géant doux parfait pour les enfants.',
            imagePath: 'assets/images/Cat.png',
          ),
          _FamilyCatCard(
            name: 'Maine Coon',
            description: 'Le géant doux parfait pour les enfants.',
            imagePath: 'assets/images/Cat.png',
          ),
          _FamilyCatCard(
            name: 'Maine Coon',
            description: 'Le géant doux parfait pour les enfants.',
            imagePath: 'assets/images/Cat.png',
          ),
        ],
      ),
    );
  }
}

class _FamilyCatCard extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;

  const _FamilyCatCard({
    required this.name,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
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
                      child: const Text(
                        'En savoir plus',
                        style: TextStyle(
                          fontSize: 16,
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
    );
  }
}

class _CalmCatCard extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;

  const _CalmCatCard({
    required this.name,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
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

class _Calm1CatCard extends StatelessWidget {
  const _Calm1CatCard();

  @override
  Widget build(BuildContext context) {
    return const _CalmCatCard(
      name: 'Scottish Fold',
      description: 'Un tempérament paisible et indépendant.',
      imagePath: 'assets/images/Cat2.png',
    );
  }
}

class _Calm2CatCard extends StatelessWidget {
  const _Calm2CatCard();

  @override
  Widget build(BuildContext context) {
    return const _CalmCatCard(
      name: 'Persan',
      description: 'La quintessence du chat de salon',
      imagePath: 'assets/images/Cat3.png',
    );
  }
}
