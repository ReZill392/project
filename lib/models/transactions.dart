class Transactions {
  final int? keyID; 
  final String title;
  final String type;
  final String genres;
  final String theme;
  final double score;
  final DateTime date;
  final String review;

  Transactions({
    this.keyID, 
    required this.title,
    required this.type,
    required this.genres,
    required this.theme,
    required this.score,
    required this.date,
    required this.review,
  });
}