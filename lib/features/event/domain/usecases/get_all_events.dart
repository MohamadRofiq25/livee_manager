import 'package:livee_manager/features/event/domain/repositories/event_repository.dart';
import '../entities/event_entity.dart';

class GetAllEvents {
  final EventRepository repository;

  GetAllEvents(this.repository);

  Future<List<EventEntity>> call() {
    return repository.getAllEvents();
  }
}
