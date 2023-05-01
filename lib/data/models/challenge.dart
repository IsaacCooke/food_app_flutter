class Challenge {
  final int? id;
  final String content;

  Challenge({
    this.id,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'content': content,
    };
  }

  factory Challenge.fromMap(Map<String, dynamic> map) {
    return Challenge(
      id: map['id'],
      content: map['content'],
    );
  }

  Challenge copy({
    int? id,
    String? content,
  }) {
    return Challenge(
      id: id ?? this.id,
      content: content ?? this.content,
    );
  }

  @override
  String toString() {
    return 'Challenge{id: $id, content: $content}';
  }
}