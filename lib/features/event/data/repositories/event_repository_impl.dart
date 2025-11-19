import '../../domain/entities/event_entity.dart';
import '../../domain/repositories/event_repository.dart';
import '../datasources/event_remote_datasource.dart';
import '../models/event_model.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource remoteDataSource;

  EventRepositoryImpl(this.remoteDataSource);

  @override
  Future<EventEntity> createEvent(EventEntity event) async {
    final model = EventModel(
      id: event.id,
      title: event.title,
      date: event.date,
      orderedBy: event.orderedBy,
      location: event.location,
      thumbnailUrl: event.thumbnailUrl,
    );
    return await remoteDataSource.createEvent(model);
  }

  @override
  Future<void> deleteEvent(String id) async {
    await remoteDataSource.deleteEvent(id);
  }

  @override
  Future<List<EventEntity>> getAllEvents() async {
    final models = await remoteDataSource.fetchAllEvents();
    return models;
  }

  @override
  Future<EventEntity?> getEventById(String id) async {
    return await remoteDataSource.fetchEventById(id);
  }

  @override
  Future<EventEntity> updateEvent(EventEntity event) async {
    final model = EventModel(
      id: event.id,
      title: event.title,
      date: event.date,
      orderedBy: event.orderedBy,
      location: event.location,
      thumbnailUrl: event.thumbnailUrl,
    );
    return await remoteDataSource.updateEvent(model);
  }
}
