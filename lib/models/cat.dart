class Cat {
  final String id;
  final String name;
  final String description;
  final String origin;
  final String? wikiUrl;
  final int? adaptability;
  final int? intelligence;
  final int? rare;
  final int? hypoallergenic;

  Cat({
    required this.id,
    required this.name,
    required this.description,
    required this.origin,
    required this.wikiUrl,
    required this.adaptability,
    required this.intelligence,
    required this.rare,
    required this.hypoallergenic,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      origin: json['origin'],
      wikiUrl: json["wikipedia_url"],
      adaptability: json["adaptability"],
      intelligence: json["intelligence"],
      rare: json["rare"],
      hypoallergenic: json["hypoallergenic"],
    );
  }

  @override
  String toString() {
    return 'Cat: id=$id, name=$name';
  }
}
