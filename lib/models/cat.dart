class Cat {
  final String id;
  final String name;
  final String description;
  final String origin;
  final String ?wikiUrl;
  final int ?adaptability;

  Cat(
      {required this.id,
      required this.name,
      required this.description,
      required this.origin,
      required this.wikiUrl,
      required this.adaptability
      });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        origin: json['origin'],
        wikiUrl: json["wikipedia_url"],
        adaptability: json["adaptability"]
        );
  }

  @override
  String toString() {
    return 'Cat: id=$id, name=$name';
  }
}
