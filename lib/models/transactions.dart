class Transactions {
  int? id; 
  String title;
  String type;
  String genres;
  String theme;
  double score;
  DateTime date;
  String review;

  Transactions({
    this.id, 
    required this.title,
    required this.type,
    required this.genres,
    required this.theme,
    required this.score,
    required this.date,
    required this.review,
  });
}