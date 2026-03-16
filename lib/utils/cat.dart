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
    required this.intelligence, required this.id,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String id,
        'name': String name,
        'reference_image_id': String imageRefId,
        'weight': {'metric': String metric},
        'temperament': String temperament,
        'origin': String origin,
        'description': String description,
        'life_span': String lifeSpan,
        'dog_friendly': int dogFriendly,
        'affection_level': int affectionLevel,
        'energy_level': int energyLevel,
        'intelligence': int intelligence,
      } =>
        Cat(
          id: id,
          name: name,
          imageRefId: imageRefId,
          metric: metric,
          temperament: temperament,
          origin: origin,
          description: description,
          lifeSpan: lifeSpan,
          dogFriendly: dogFriendly,
          affectionLevel: affectionLevel,
          energyLevel: energyLevel,
          intelligence: intelligence,
        ),
      _ => throw FormatException('Invalid JSON format for Cat'),
    };
  }
}
