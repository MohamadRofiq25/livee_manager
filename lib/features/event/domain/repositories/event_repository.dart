import '../entities/event_entity.dart';

abstract class EventRepository {
  Future<List<EventEntity>> getAllEvents();
  Future<EventEntity?> getEventById(String id);
  Future<EventEntity> createEvent(EventEntity event);
  Future<EventEntity> updateEvent(EventEntity event);
  Future<void> deleteEvent(String id);
}
