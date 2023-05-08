class Place {
  final String name;
  final String imageUrl;
  final bool worldHeritage;
  final String description;

  Place({
    required this.name,
    required this.imageUrl,
    this.worldHeritage = false,
    required this.description,
  });
}
