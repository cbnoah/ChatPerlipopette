class Cat {
  final String id;
  final String name;
  final String imageRefId;
  final String metric;
  final String temperament;
  final String origin;
  final String description;
  final String lifeSpan;
  final int dogFriendly;
  final int affectionLevel;
  final int energyLevel;
  final int intelligence;
  final double? latitude;
  final double? longitude;

  Cat({
    required this.name,
    required this.imageRefId,
    required this.metric,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.dogFriendly,
    required this.affectionLevel,
    required this.energyLevel,
    required this.intelligence,
    required this.id,
    this.latitude,
    this.longitude,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];

    if (id is! String || id.isEmpty || name is! String || name.isEmpty) {
      throw const FormatException('Invalid JSON format for Cat: missing id/name');
    }

    final weight = json['weight'];
    final metric = switch (weight) {
      {'metric': final String value} => value,
      _ => '',
    };

    return Cat(
      id: id,
      name: name,
      imageRefId: _asString(json['reference_image_id']),
      metric: metric,
      temperament: _asString(json['temperament']),
      origin: _asString(json['origin']),
      description: _asString(json['description']),
      lifeSpan: _asString(json['life_span']),
      dogFriendly: _asInt(json['dog_friendly']),
      affectionLevel: _asInt(json['affection_level']),
      energyLevel: _asInt(json['energy_level']),
      intelligence: _asInt(json['intelligence']),
    );
  }

  static String _asString(dynamic value) => value is String ? value : '';

  static int _asInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }
}
