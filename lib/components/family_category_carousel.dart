import 'package:chatperlipopette/utils/api_scrapper.dart';
import 'package:flutter/material.dart';
import '../utils/cat.dart';
import 'cat_carousel_card.dart';

class FamilyCategoryCarousel extends StatefulWidget {
  final BuildContext context;

  const FamilyCategoryCarousel({super.key, required this.context});

  @override
  State<FamilyCategoryCarousel> createState() => _FamilyCategoryCarouselState();
}

class _FamilyCategoryCarouselState extends State<FamilyCategoryCarousel> {
  late final Future<List<Cat>> randomCats;

  @override
  void initState() {
    super.initState();
    randomCats = _fetchRandomCats();
  }

  Future<List<Cat>> _fetchRandomCats() async {
    final cats = await fetchCatsList();
    final shuffled = List<Cat>.from(cats)..shuffle();
    return shuffled.take(3).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: FutureBuilder<List<Cat>>(
        future: randomCats,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Erreur de chargement'));
          }

          final cats = snapshot.data ?? const <Cat>[];
          if (cats.isEmpty) {
            return const Center(child: Text('Aucun chat trouve'));
          }

          return CarouselView(
            scrollDirection: Axis.horizontal,
            itemExtent: 250,
            shrinkExtent: 250,
            itemSnapping: true,
            children: cats
                .map(
                  (cat) => CatCarouselCard(
                    name: cat.name,
                    description: cat.description,
                    imagePath: "https://cdn2.thecatapi.com/images/${cat.imageRefId}.jpg",
                    context: context,
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
