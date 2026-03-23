import 'package:chatperlipopette/components/search_page_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/cat.dart';

class SearchResults extends StatefulWidget {
  final RefreshCallback pullRefresh;
  final Future<List<Cat>> futureCats;
  final Set<String> filterSelected;

  const SearchResults({
    super.key,
    required this.pullRefresh,
    required this.futureCats,
    required this.filterSelected,
  });

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  RefreshCallback get _pullRefresh => widget.pullRefresh;

  Future<List<Cat>> get _futureCats => widget.futureCats;

  Set<String> get _filterSelected => widget.filterSelected;

  List<String> _normalizedTags(String temperament) {
    return temperament
        .split(',')
        .map((tag) => tag.trim().toLowerCase())
        .where((tag) => tag.isNotEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: FutureBuilder(
          future: _futureCats,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(color: Colors.black),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  'No cats found',
                  style: TextStyle(color: Colors.black),
                ),
              );
            } else {
              final List<Cat> cats = snapshot.data!;
              final String activeFilter = _filterSelected.isEmpty
                  ? 'tous'
                  : _filterSelected.first.trim().toLowerCase();
              final List<Cat> visibleCats = activeFilter == 'tous'
                  ? cats
                  : cats
                      .where(
                        (cat) => _normalizedTags(cat.temperament)
                            .contains(activeFilter),
                      )
                      .toList();

              if (visibleCats.isEmpty) {
                return const Center(
                  child: Text(
                    "Aucun chat n'a ete trouve",
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }

              return ListView.separated(
                itemCount: visibleCats.length,
                itemBuilder: (context, index) {
                  final Cat cat = visibleCats[index];
                  return SearchPageContainer(
                    id: cat.id,
                    title: cat.name,
                    subtitle: cat.origin,
                    description: cat.description,
                    imageUrl:
                        "https://cdn2.thecatapi.com/images/${cat.imageRefId}.jpg",
                    tags: cat.temperament
                        .split(',')
                        .map((tag) => tag.trim())
                        .where((tag) => tag.isNotEmpty)
                        .toList(),
                    onPressed: () => context.push('/breed/${cat.id}'),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 15);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
