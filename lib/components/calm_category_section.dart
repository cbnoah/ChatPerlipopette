import 'package:flutter/material.dart';
import '../utils/api_scrapper.dart';
import '../utils/cat.dart';
import 'cat_horizontal_card.dart';

class CalmCategorySection extends StatefulWidget {
  final BuildContext context;

  const CalmCategorySection({super.key, required this.context});

  @override
  State<CalmCategorySection> createState() => _CalmCategorySectionState();
}

class _CalmCategorySectionState extends State<CalmCategorySection> {
  late final Future<List<Cat>> randomCats;

  @override
  void initState() {
    super.initState();
    randomCats = _fetchRandomCats();
  }

  Future<List<Cat>> _fetchRandomCats() async {
    final cats = await fetchCatsList();
    final shuffled = List<Cat>.from(cats)..shuffle();
    return shuffled.take(2).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cat>>(
      future: randomCats,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (asyncSnapshot.hasError) {
          return const Center(child: Text('Erreur de chargement'));
        }

        final cats = asyncSnapshot.data ?? const <Cat>[];
        if (cats.isEmpty) {
          return const Center(child: Text('Aucun chat trouve'));
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final cat = cats[index];
            return CatHorizontalCard(
              name: cat.name,
              description: cat.description,
              imagePath: "https://cdn2.thecatapi.com/images/${cat.imageRefId}.jpg",
              context: context,
              id: cat.id,
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 10),
          itemCount: cats.length,
        );
      },
    );
  }
}

