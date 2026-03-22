import "dart:convert";

import "package:chatperlipopette/utils/cat.dart";
import "package:geocoding/geocoding.dart";
import "package:http/http.dart" as http;

// Mapping de secours pour les pays courants
final Map<String, Map<String, double>> _countryCoordinates = {
  'abyssinian': {'latitude': 9.1450, 'longitude': 40.4897}, // Ethiopia
  'afghanistan': {'latitude': 33.9391, 'longitude': 67.3999},
  'africa': {'latitude': -8.7832, 'longitude': 34.5085},
  'asia': {'latitude': 34.0479, 'longitude': 100.6197},
  'australia': {'latitude': -25.2744, 'longitude': 133.7751},
  'austria': {'latitude': 47.5162, 'longitude': 14.5501},
  'bengal': {'latitude': 24.5355, 'longitude': 88.3629}, // India
  'brazil': {'latitude': -14.2350, 'longitude': -51.9253},
  'british': {'latitude': 55.3781, 'longitude': -3.4360}, // UK
  'bulgaria': {'latitude': 42.7339, 'longitude': 25.4858},
  'burma': {'latitude': 21.9162, 'longitude': 95.9560}, // Myanmar
  'cambodia': {'latitude': 12.5657, 'longitude': 104.9910},
  'canada': {'latitude': 56.1304, 'longitude': -106.3468},
  'chile': {'latitude': -35.6751, 'longitude': -71.5430},
  'china': {'latitude': 35.8617, 'longitude': 104.1954},
  'cyprus': {'latitude': 34.9249, 'longitude': 33.4299},
  'czech': {'latitude': 49.8175, 'longitude': 15.4730},
  'denmark': {'latitude': 56.2639, 'longitude': 9.5018},
  'devon': {'latitude': 50.7184, 'longitude': -3.5339}, // UK
  'egypt': {'latitude': 26.8206, 'longitude': 30.8025},
  'england': {'latitude': 52.3555, 'longitude': -1.1743}, // UK
  'estonia': {'latitude': 58.5953, 'longitude': 25.0136},
  'europe': {'latitude': 54.5260, 'longitude': 15.2551},
  'france': {'latitude': 46.2276, 'longitude': 2.2137},
  'germany': {'latitude': 51.1657, 'longitude': 10.4515},
  'greece': {'latitude': 39.0742, 'longitude': 21.8243},
  'himalaya': {'latitude': 27.9881, 'longitude': 86.9250}, // Nepal
  'hungary': {'latitude': 47.1625, 'longitude': 19.5033},
  'iceland': {'latitude': 64.9631, 'longitude': -19.0208},
  'india': {'latitude': 20.5937, 'longitude': 78.9629},
  'iran': {'latitude': 32.4279, 'longitude': 53.6880},
  'iraq': {'latitude': 33.2232, 'longitude': 43.6793},
  'ireland': {'latitude': 53.4129, 'longitude': -8.2439},
  'israel': {'latitude': 31.0461, 'longitude': 34.8516},
  'italy': {'latitude': 41.8719, 'longitude': 12.5674},
  'japan': {'latitude': 36.2048, 'longitude': 138.2529},
  'java': {'latitude': -7.0726, 'longitude': 110.2140}, // Indonesia
  'jordan': {'latitude': 30.5852, 'longitude': 36.2384},
  'kenya': {'latitude': -0.0236, 'longitude': 37.9062},
  'korea': {'latitude': 35.9078, 'longitude': 127.7669}, // South Korea
  'kyrgyzstan': {'latitude': 41.2044, 'longitude': 74.7661},
  'laos': {'latitude': 19.8563, 'longitude': 102.4955},
  'latvia': {'latitude': 56.8796, 'longitude': 24.6032},
  'lebanon': {'latitude': 33.8547, 'longitude': 35.8623},
  'liechtenstein': {'latitude': 47.1660, 'longitude': 9.5554},
  'lithuania': {'latitude': 55.1694, 'longitude': 23.8813},
  'luxembourg': {'latitude': 49.8153, 'longitude': 6.1296},
  'madagascar': {'latitude': -18.7669, 'longitude': 46.8691},
  'malawi': {'latitude': -13.2543, 'longitude': 34.3015},
  'malaysia': {'latitude': 4.2105, 'longitude': 101.6964},
  'mali': {'latitude': 17.5707, 'longitude': -3.9962},
  'malta': {'latitude': 35.9375, 'longitude': 14.3754},
  'mexico': {'latitude': 23.6345, 'longitude': -102.5528},
  'middle east': {'latitude': 34.5553, 'longitude': 42.0521},
  'mongolia': {'latitude': 46.8625, 'longitude': 103.8467},
  'nepal': {'latitude': 28.3949, 'longitude': 84.1240},
  'netherlands': {'latitude': 52.1326, 'longitude': 5.2913},
  'new zealand': {'latitude': -40.9006, 'longitude': 174.8860},
  'nigeria': {'latitude': 9.0820, 'longitude': 8.6753},
  'north america': {'latitude': 54.5260, 'longitude': -105.2551},
  'north africa': {'latitude': 20.0, 'longitude': 8.0},
  'norway': {'latitude': 60.4720, 'longitude': 8.4689},
  'pakistan': {'latitude': 30.3753, 'longitude': 69.3451},
  'persia': {'latitude': 32.4279, 'longitude': 53.6880}, // Iran
  'peru': {'latitude': -9.1900, 'longitude': -75.0152},
  'philippines': {'latitude': 12.8797, 'longitude': 121.7740},
  'poland': {'latitude': 51.9194, 'longitude': 19.1451},
  'portugal': {'latitude': 39.3999, 'longitude': -8.2245},
  'romania': {'latitude': 45.9432, 'longitude': 24.9668},
  'russia': {'latitude': 61.5240, 'longitude': 105.3188},
  'scotland': {'latitude': 56.4907, 'longitude': -4.2026}, // UK
  'southeast asia': {'latitude': 12.5657, 'longitude': 104.9910},
  'somalia': {'latitude': 5.1521, 'longitude': 46.1996},
  'south africa': {'latitude': -30.5595, 'longitude': 22.9375},
  'south america': {'latitude': -8.7832, 'longitude': -55.4915},
  'soviet': {'latitude': 61.5240, 'longitude': 105.3188}, // Russia
  'spain': {'latitude': 40.4637, 'longitude': -3.7492},
  'sudan': {'latitude': 12.8628, 'longitude': 30.8075},
  'swaziland': {'latitude': -26.5225, 'longitude': 31.4659},
  'sweden': {'latitude': 60.1282, 'longitude': 18.6435},
  'switzerland': {'latitude': 46.8182, 'longitude': 8.2275},
  'syria': {'latitude': 34.8021, 'longitude': 38.9968},
  'taiwan': {'latitude': 23.6978, 'longitude': 120.9605},
  'tanzania': {'latitude': -6.3690, 'longitude': 34.8888},
  'thailand': {'latitude': 15.8700, 'longitude': 100.9925},
  'tibet': {'latitude': 30.0000, 'longitude': 91.0000},
  'turkey': {'latitude': 38.9637, 'longitude': 35.2433},
  'turkmenia': {'latitude': 38.9697, 'longitude': 59.5563},
  'uganda': {'latitude': 1.3733, 'longitude': 32.2903},
  'ukraine': {'latitude': 48.3794, 'longitude': 31.1656},
  'united arab emirates': {'latitude': 23.4241, 'longitude': 53.8478},
  'united kingdom': {'latitude': 55.3781, 'longitude': -3.4360},
  'united states': {'latitude': 37.0902, 'longitude': -95.7129},
  'u.s.': {'latitude': 37.0902, 'longitude': -95.7129},
  'usa': {'latitude': 37.0902, 'longitude': -95.7129},
  'vietnam': {'latitude': 14.0583, 'longitude': 108.2772},
  'wales': {'latitude': 52.3555, 'longitude': -3.4360}, // UK
  'yemen': {'latitude': 15.5527, 'longitude': 48.5164},
  'zimbabwe': {'latitude': -19.0154, 'longitude': 29.1549},
};

Future<Map<String, double?>> getCoordinatesFromOrigin(String origin) async {
  try {
    if (origin.isEmpty) {
      return {'latitude': null, 'longitude': null};
    }

    // Essayer le géocodage d'abord
    try {
      List<Location> locations = await locationFromAddress(origin);
      if (locations.isNotEmpty) {
        return {
          'latitude': locations.first.latitude,
          'longitude': locations.first.longitude,
        };
      }
    } catch (e) {
      // Le géocodage a échoué, essayer le mapping de secours
    }

    // Utiliser le mapping de secours si le géocodage échoue
    final originLower = origin.toLowerCase().trim();
    if (_countryCoordinates.containsKey(originLower)) {
      final coords = _countryCoordinates[originLower]!;
      return {
        'latitude': coords['latitude'],
        'longitude': coords['longitude'],
      };
    }

    // Chercher une correspondance partielle
    for (final key in _countryCoordinates.keys) {
      if (originLower.contains(key) || key.contains(originLower)) {
        final coords = _countryCoordinates[key]!;
        return {
          'latitude': coords['latitude'],
          'longitude': coords['longitude'],
        };
      }
    }
  } catch (e) {
    // Erreur lors du géocodage - coordonnées non disponibles
    print('Erreur de géocodage pour "$origin": $e');
  }
  return {'latitude': null, 'longitude': null};
}

Future<Cat> fetchCat(String id) async {
  final response = await http.get(
    Uri.parse('https://api.thecatapi.com/v1/breeds/$id'),
  );

  if (response.statusCode == 200) {
    final catJson = Cat.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    
    // Récupérer les coordonnées à partir de l'origine
    final coords = await getCoordinatesFromOrigin(catJson.origin);
    
    return Cat(
      id: catJson.id,
      name: catJson.name,
      imageRefId: catJson.imageRefId,
      metric: catJson.metric,
      temperament: catJson.temperament,
      origin: catJson.origin,
      description: catJson.description,
      lifeSpan: catJson.lifeSpan,
      dogFriendly: catJson.dogFriendly,
      affectionLevel: catJson.affectionLevel,
      energyLevel: catJson.energyLevel,
      intelligence: catJson.intelligence,
      latitude: coords['latitude'],
      longitude: coords['longitude'],
    );
  } else {
    throw Exception("Failed to load cat data");
  }
}

Future<List<Cat>> fetchCatsList({int? limit, String? query}) async {
  String url = 'https://api.thecatapi.com/v1/breeds?';
  if (limit != null) url = 'https://api.thecatapi.com/v1/breeds?limit=$limit';
  if (query != null && query != "") url = 'https://api.thecatapi.com/v1/breeds/search?q=$query';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final items = jsonDecode(response.body) as List<dynamic>;
    final cats = <Cat>[];

    for (final item in items) {
      if (item is! Map<String, dynamic>) continue;
      try {
        final catJson = Cat.fromJson(item);
        
        // Récupérer les coordonnées à partir de l'origine
        final coords = await getCoordinatesFromOrigin(catJson.origin);
        
        final catWithCoords = Cat(
          id: catJson.id,
          name: catJson.name,
          imageRefId: catJson.imageRefId,
          metric: catJson.metric,
          temperament: catJson.temperament,
          origin: catJson.origin,
          description: catJson.description,
          lifeSpan: catJson.lifeSpan,
          dogFriendly: catJson.dogFriendly,
          affectionLevel: catJson.affectionLevel,
          energyLevel: catJson.energyLevel,
          intelligence: catJson.intelligence,
          latitude: coords['latitude'],
          longitude: coords['longitude'],
        );
        
        cats.add(catWithCoords);
      } on FormatException {
        // Ignore invalid records instead of failing the entire response.
      }
    }

    return cats;
  } else {
    throw Exception("Failed to load cat data");
  }
}
