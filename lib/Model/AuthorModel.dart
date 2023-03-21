class Author {
  String? book;
  String? authorName;
  String? description;

  Author(
      {required this.book,
      required this.authorName,
      required this.description});

  Author.fromMap(Map<String, dynamic> map) {
    book = map[book];
    authorName = map[authorName];
    description = map[description];
  }

  Map<String, dynamic> toMap() => {
        'book': book,
        'authorName': authorName,
        'description': description,
      };
}
