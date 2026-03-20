import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../utils/api_scrapper.dart';
import '../utils/cat.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: FutureBuilder(
          future: _cat,
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: LinearProgressIndicator());
            } else {
              return Text(
                asyncSnapshot.data!.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
          },
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/icons/Arrow.png'),
          ),
        ),
      ),
      body: FutureBuilder(
        future: _cat,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (asyncSnapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${asyncSnapshot.error}',
                style: TextStyle(color: Colors.black),
              ),
            );
          } else if (!asyncSnapshot.hasData) {
            return const Center(
              child: Text(
                "This cat hasn't been found",
                style: TextStyle(color: Colors.black),
              ),
            );
          } else {
            Cat futureCatData = asyncSnapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    tag: widget.id,
                    child: ClipRect(
                      child: Image.network(
                        "https://cdn2.thecatapi.com/images/${futureCatData.imageRefId}.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 400,
                        errorBuilder:
                            (
                              BuildContext context,
                              Object exception,
                              StackTrace? stackTrace,
                            ) {
                              return Image.asset(
                                alignment: FractionalOffset.topCenter,
                                fit: BoxFit.cover,
                                'assets/images/image_error.png',
                              );
                            },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    futureCatData.name,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Color(0xFFFF9500),
                                        size: 18,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        futureCatData.origin,
                                        style: TextStyle(
                                          color: Color(0xFFFF9500),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.favorite_border,
                              color: Color(0xFFFF9500),
                              size: 28,
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildAttributeCard(
                              '❤︎',
                              'Affection',
                              '${futureCatData.affectionLevel}/5',
                            ),
                            _buildAttributeCard(
                              '⚡︎',
                              'Énergie',
                              '${futureCatData.energyLevel}/5',
                            ),
                            _buildAttributeCard(
                              '🧠',
                              'Intelligence',
                              '${futureCatData.intelligence}/5',
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Text(
                              'Tempérament',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(
                          futureCatData.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            height: 1.6,
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Text(
                              'Caractéristiques physiques',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF5E6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Poids',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                '${futureCatData.metric} kg',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Text(
                              'Conseils de soin',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF5E6),
                            borderRadius: BorderRadius.circular(12),
                            border: Border(
                              left: BorderSide(
                                color: Color(0xFFFF9500),
                                width: 4,
                              ),
                            ),
                          ),
                          child: Text(
                            'Un brossage hebdomadaire est essentiel pour éviter les nœuds dans leur fourrure dense. Pendant la mue, un brossage quotidien est recommandé.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                              height: 1.6,
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Text(
                              'Origine',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: 300,
                            child: FlutterMap(
                              options: MapOptions(
                                initialCenter: LatLng(45.5017, -69.1411),
                                initialZoom: 6,
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
                                  subdomains: const ['a', 'b', 'c'],
                                ),
                                MarkerLayer(
                                  markers: [
                                    Marker(
                                      point: LatLng(45.5017, -69.1411),
                                      width: 80,
                                      height: 80,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withValues(alpha: 0.3),
                                                  blurRadius: 4,
                                                ),
                                              ],
                                            ),
                                            padding: EdgeInsets.all(8),
                                            child: Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withValues(alpha: 0.2),
                                                  blurRadius: 2,
                                                ),
                                              ],
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 6,
                                              vertical: 3,
                                            ),
                                            child: Text(
                                              'Maine, USA',
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
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

  Widget _buildAttributeCard(String emoji, String label, String value) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: Color(0xFFFFF5E6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(emoji, style: TextStyle(fontSize: 28)),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
