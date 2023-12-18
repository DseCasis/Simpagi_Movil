class Note {
  final int? id;
  final String title;
  final String content;

  Note({this.id, required this.title, required this.content});

  Note.empty()
      : id = 0,
        title = '',
        content = '';

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'content': content};
  }

  // Aquí está el método fromMap
  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
    );
  }
}
