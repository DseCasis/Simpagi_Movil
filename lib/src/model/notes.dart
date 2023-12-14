class Note {
  final int id;
  final String title;
  final String content;

  Note({required this.id, required this.title, required this.content});
  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'content': content};
  }
}
