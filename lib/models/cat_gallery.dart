class CatGallery {
  final String id;
  final String url;

  CatGallery({
    required this.id,
    required this.url,
  });

  factory CatGallery.fromJson(Map<String, dynamic> json) {
    return CatGallery(
      id: json['id'],
      url: json['name'],
    );
  }

  @override
  String toString() {
    return 'Cat: id=$id';
  }
}
