class Note{
  Note({ 
  required this.title, 
  required this.content,
  required this.contentjson,
  required this.datecreated,
  required this.datemodified,
  required this.tags});

  final String title;
  final String content;
  final String contentjson;
  final int datecreated;
  final int datemodified;
  final List<String> tags;
}