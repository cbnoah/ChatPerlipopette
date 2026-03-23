import 'dart:async';

import 'package:chatperlipopette/components/search_results.dart';
import 'package:flutter/material.dart';

import '../utils/api_scrapper.dart';
import '../utils/cat.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late Future<List<Cat>> _futureCats;
  final TextEditingController _searchController = TextEditingController();
  Set<String> _chipsFilters = {'Tous'};
  final _filterSelected = <String>{'Tous'};

  Timer? _searchDebounce;
  static const Duration _searchCooldown = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _initCats();
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String text) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(_searchCooldown, () {
      _initCats(text.trim());
    });
  }

  Future<void> _initCats([String? query]) async {
    final future = fetchCatsList(query: query);
    setState(() {
      _futureCats = future;
    });

    final cats = await future;
    if (!mounted) return;

    final filters = <String>{'Tous'};
    for (final cat in cats) {
      filters.addAll(cat.temperament.split(', '));
    }

    setState(() {
      _chipsFilters = filters;
    });
  }

  Future<void> _pullRefresh() async {
    _initCats();
  }

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
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Column(
            spacing: 10,
            children: [
              // Search Bar
              TextField(
                controller: _searchController,
                onChanged: (text) {
                  setState(() {});
                  _onSearchChanged(text);
                },
                style: TextStyle(color: Theme.of(context).colorScheme.onInverseSurface),
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
                      image: AssetImage("assets/icons/search.png"),
                      width: 20,
                      height: 20,
                    ),
                  ),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            _initCats();
                            setState(() {
                              _searchController.text = "";
                            });
                          },
                          icon: Icon(Icons.close),
                        )
                      : null,
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
                    final String filter = _chipsFilters.elementAt(index);
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
              SearchResults(
                pullRefresh: () => _pullRefresh(),
                futureCats: _futureCats,
                filterSelected: _filterSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
