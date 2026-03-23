import 'package:flutter/material.dart';
import '../components/introduction_section.dart';
import '../components/section_title.dart';
import '../components/family_category_carousel.dart';
import '../components/calm_category_section.dart';

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
              IntroductionSection(context: context),
              const SizedBox(height: 30),
              SectionTitle(title: 'Pour les familles', context: context),
              const SizedBox(height: 10),
              FamilyCategoryCarousel(context: context),
              const SizedBox(height: 20),
              SectionTitle(title: 'Calmes & Affectueux', context: context),
              const SizedBox(height: 10),
              CalmCategorySection(context: context),
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

