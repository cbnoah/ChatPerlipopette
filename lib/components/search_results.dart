import 'package:chatperlipopette/components/search_page_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/cat.dart';

class SearchResults extends StatefulWidget {
  final RefreshCallback pullRefresh;
  final Future<List<Cat>> futureCats;
  final Set<String> filterSelected;

  const SearchResults(
      {super.key, required this.pullRefresh, required this.futureCats, required this.filterSelected});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  RefreshCallback get _pullRefresh => widget.pullRefresh;
  Future<List<Cat>> get _futureCats => widget.futureCats;
  Set<String> get _filterSelected => widget.filterSelected;


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
              return cats.isEmpty
                  ? Text(
                "Aucun chat n'a été trouvé",
                style: TextStyle(color: Colors.black),
              )
                  : ListView.separated(
                itemCount: cats.length,
                itemBuilder: (context, index) {
                  final Cat cat = cats[index];
                  if (_filterSelected.first != "Tous") {
                    return cat.temperament
                        .split(',')
                        .contains(_filterSelected.first)
                        ? SearchPageContainer(
                      id: cat.name,
                      title: cat.name,
                      subtitle: cat.origin,
                      description: cat.description,
                      imageUrl:
                      "https://cdn2.thecatapi.com/images/${cat.imageRefId}.jpg",
                      tags: cat.temperament.split(', '),
                      onPressed: () =>
                          context.push(
                            '/breed/${cat.id}',
                          ),
                    )
                        : null;
                  }
                  return SearchPageContainer(
                    id: cat.id,
                    title: cat.name,
                    subtitle: cat.origin,
                    description: cat.description,
                    imageUrl:
                    "https://cdn2.thecatapi.com/images/${cat.imageRefId}.jpg",
                    tags: cat.temperament.split(', '),
                    onPressed: () =>
                        context.push('/breed/${cat.id}'),
                  );
                },
                separatorBuilder:
                    (BuildContext context, int index) {
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
