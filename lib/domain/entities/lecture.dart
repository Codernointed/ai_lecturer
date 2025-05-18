/// Represents a lecture in the application
class Lecture {
  /// Unique identifier for the lecture
  final String id;

  /// Title of the lecture
  final String title;

  /// Full text content of the lecture
  final String content;

  /// When the lecture was created
  final DateTime createdAt;

  /// When the lecture was last accessed
  final DateTime? lastAccessedAt;

  /// Path to the saved file, if any
  final String? filePath;

  const Lecture({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    this.lastAccessedAt,
    this.filePath,
  });

  /// Create a copy of the lecture with modified fields
  Lecture copyWith({
    String? title,
    String? content,
    DateTime? lastAccessedAt,
    String? filePath,
  }) {
    return Lecture(
      id: id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt,
      lastAccessedAt: lastAccessedAt ?? this.lastAccessedAt,
      filePath: filePath ?? this.filePath,
    );
  }

  /// Update the last accessed time to now
  Lecture markAsAccessed() {
    return copyWith(lastAccessedAt: DateTime.now());
  }

  /// Create a new lecture with current timestamp
  factory Lecture.create({
    required String title,
    required String content,
    String? filePath,
  }) {
    return Lecture(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      content: content,
      createdAt: DateTime.now(),
      lastAccessedAt: DateTime.now(),
      filePath: filePath,
    );
  }

  /// Create a lecture from file data
  factory Lecture.fromFile({
    required String title,
    required String content,
    required String filePath,
  }) {
    return Lecture.create(title: title, content: content, filePath: filePath);
  }

  /// Convert lecture to a map for storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'created_at': createdAt.millisecondsSinceEpoch,
      'last_accessed_at': lastAccessedAt?.millisecondsSinceEpoch,
      'file_path': filePath,
    };
  }

  /// Create a lecture from a map from storage
  factory Lecture.fromMap(Map<String, dynamic> map) {
    return Lecture(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      lastAccessedAt:
          map['last_accessed_at'] != null
              ? DateTime.fromMillisecondsSinceEpoch(map['last_accessed_at'])
              : null,
      filePath: map['file_path'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Lecture &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          content == other.content;

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ content.hashCode;
}
