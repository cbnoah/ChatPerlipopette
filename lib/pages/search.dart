import 'package:chatperlipopette/components/search_page_container.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _chipsFilters = <String>[
    "Tous",
    "Poils longs",
    "Calme",
    "Actif",
  ];
  final _filterSelected = <String>{'Tous'};

  final List<SearchPageContainer> _searchResults = <SearchPageContainer>[
    SearchPageContainer(
      title: "Maina Aoon",
      subtitle: "Le Doux Géant",
      description:
          "Originaire des États-Unis, c'est l'une des plus grandes races de chats domestiques. Reconnu pour sa queue en panache et son tempérament amical.",
      imageUrl:
          "https://i1.sndcdn.com/artworks-3x6dTuKd6wyI4ebk-UHpthA-t1080x1080.jpg",
      tags: ["Affectueux", "Grand"],
    ),
    SearchPageContainer(
      title: "Maina Aoon",
      subtitle: "Le Doux Géant",
      description:
          "Originaire des États-Unis, c'est l'une des plus grandes races de chats domestiques. Reconnu pour sa queue en panache et son tempérament amical.",
      imageUrl: "https://media.tenor.com/3GNN7PT7oeMAAAAe/cat-goofy.png",
      tags: ["Affectueux", "Grand"],
    ),
    SearchPageContainer(
      title: "Maina Aoon",
      subtitle: "Le Doux Géant",
      description:
          "Originaire des États-Unis, c'est l'une des plus grandes races de chats domestiques. Reconnu pour sa queue en panache et son tempérament amical.",
      imageUrl:
          "https://i.redd.it/goofy-ahh-cat-v0-ilon66sme61a1.jpg?width=914&format=pjpg&auto=webp&s=738f9007d5ebd245067278525a9bd30a15bd1a83",
      tags: ["Affectueux", "Grand"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shadowColor: Theme.of(context).colorScheme.primary,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        elevation: 1,
        title: Center(
          child: Text(
            "Découvrez les chats",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onInverseSurface,
              fontFamily: "Plus Jakarta Sans",
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 10,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  fillColor: Theme.of(context).colorScheme.onSurface,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1.5,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image(
                      image: AssetImage("icons/search.png"),
                      width: 20,
                      height: 20,
                    ),
                  ),
                  hint: Text(
                    "Recherchez une race",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontFamily: "Plus Jakarta Sans",
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              // Chips Filters
              SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final String filter = _chipsFilters[index];
                    final bool isSelected = _filterSelected.contains(filter);
                    return ChoiceChip(
                      label: Text(
                        filter,
                        style: TextStyle(
                          fontFamily: "Plus Jakarta Sans",
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? Theme.of(context).colorScheme.onSurface
                              : Theme.of(context).colorScheme.onInverseSurface,
                        ),
                      ),
                      selected: isSelected,
                      selectedColor: Theme.of(context).colorScheme.primary,
                      backgroundColor: Theme.of(context).colorScheme.onSurface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: isSelected
                              ? Colors.transparent
                              : Theme.of(context).colorScheme.secondary,
                          width: 1.5,
                        ),
                      ),
                      elevation: isSelected ? 1 : 0,
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            _filterSelected
                              ..clear()
                              ..add(filter);
                          } else {
                            _filterSelected.remove(filter);
                            _filterSelected.add("Tous");
                          }
                        });
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10);
                  },
                  itemCount: _chipsFilters.length,
                ),
              ),
              // Container for the search results
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 16);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return _searchResults[index];
                  },
                  itemCount: _searchResults.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
