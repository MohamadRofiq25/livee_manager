import 'package:livee_manager/features/event/domain/repositories/event_repository.dart';
import '../entities/event_entity.dart';

class CreateEvent {
  final EventRepository repository;

  CreateEvent(this.repository);

  Future<EventEntity> call(EventEntity event) {
    return repository.createEvent(event);
  }
}
