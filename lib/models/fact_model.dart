enum kCategories {
  Category1,
  Category2,
  Category3,
  Category4,
  Category5,
  Category6,
  Category7,
  Category8,
  Category9,
  Category10,
}

class Fact {
  const Fact({
    required this.id,
    required this.content,
    required this.category,
  });

  final String id;
  final String content;
  final String category;
}
