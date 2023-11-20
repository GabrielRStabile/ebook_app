class BookEntity {
  final int id;
  final String title;
  final String author;
  final String coverUrl;
  final String downloadUrl;

  BookEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.downloadUrl,
  });

  BookEntity copyWith({
    int? id,
    String? title,
    String? author,
    String? coverUrl,
    String? downloadUrl,
  }) {
    return BookEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      coverUrl: coverUrl ?? this.coverUrl,
      downloadUrl: downloadUrl ?? this.downloadUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookEntity &&
        other.id == id &&
        other.title == title &&
        other.author == author &&
        other.coverUrl == coverUrl &&
        other.downloadUrl == downloadUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        author.hashCode ^
        coverUrl.hashCode ^
        downloadUrl.hashCode;
  }
}
