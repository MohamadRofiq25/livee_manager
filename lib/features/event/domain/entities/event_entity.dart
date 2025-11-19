class EventEntity {
  final String id;
  final String title;
  final DateTime date;
  final String orderedBy;
  final String location;
  final String thumbnailUrl; // optional

  EventEntity({
    required this.id,
    required this.title,
    required this.date,
    required this.orderedBy,
    this.location = '',
    this.thumbnailUrl = '',
  });
}
