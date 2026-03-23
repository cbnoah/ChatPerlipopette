import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../utils/api_scrapper.dart';
import '../utils/cat.dart';
import '../components/cat_image_hero.dart';
import '../components/cat_header_section.dart';
import '../components/cat_attributes_section.dart';
import '../components/cat_temperament_section.dart';
import '../components/cat_physical_characteristics_section.dart';
import '../components/cat_care_advice_section.dart';
import '../components/cat_origin_map_section.dart';

class CatsInfos extends StatefulWidget {
  final String id;

  const CatsInfos({super.key, required this.id});

  @override
  State<CatsInfos> createState() => _CatsInfosState();
}

class _CatsInfosState extends State<CatsInfos> {
  late Future<Cat> _cat;

  Future<void> _initCat() async {
    final future = fetchCat(widget.id);
    setState(() {
      _cat = future;
    });
    if (!mounted) return;
  }

  @override
  void initState() {
    super.initState();
    _initCat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: _buildAppBar(),
      body: FutureBuilder(
        future: _cat,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (asyncSnapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${asyncSnapshot.error}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
              ),
            );
          } else if (!asyncSnapshot.hasData) {
            return Center(
              child: Text(
                "This cat hasn't been found",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
              ),
            );
          } else {
            Cat cat = asyncSnapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  CatImageHero(catId: widget.id, imageRefId: cat.imageRefId),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CatHeaderSection(cat: cat),
                        SizedBox(height: 25),
                        CatAttributesSection(cat: cat),
                        SizedBox(height: 25),
                        CatTemperamentSection(cat: cat),
                        SizedBox(height: 25),
                        CatPhysicalCharacteristicsSection(cat: cat),
                        SizedBox(height: 25),
                        CatCareAdviceSection(),
                        SizedBox(height: 25),
                        CatOriginMapSection(cat: cat),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: FutureBuilder(
        future: _cat,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: LinearProgressIndicator());
          } else {
            return Text(
              asyncSnapshot.data!.name,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onInverseSurface,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            );
          }
        },
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          if (GoRouter.of(context).canPop()) {
            GoRouter.of(context).pop();
          } else {
            GoRouter.of(context).go('/');
          }
        },
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset('assets/icons/Arrow.png'),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => SharePlus.instance.share(
            ShareParams(uri: Uri.parse("chatperlipopette:/breed/${widget.id}")),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 0, right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(Icons.share, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

