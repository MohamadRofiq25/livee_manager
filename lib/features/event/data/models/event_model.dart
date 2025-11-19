import '../../domain/entities/event_entity.dart';

class EventModel extends EventEntity {
  EventModel({
    required String id,
    required String title,
    required DateTime date,
    required String orderedBy,
    String location = '',
    String thumbnailUrl = '',
  }) : super(
          id: id,
          title: title,
          date: date,
          orderedBy: orderedBy,
          location: location,
          thumbnailUrl: thumbnailUrl,
        );

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as String,
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      orderedBy: json['orderedBy'] as String,
      location: json['location'] as String? ?? '',
      thumbnailUrl: json['thumbnailUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'orderedBy': orderedBy,
      'location': location,
      'thumbnailUrl': thumbnailUrl,
    };
  }
}
