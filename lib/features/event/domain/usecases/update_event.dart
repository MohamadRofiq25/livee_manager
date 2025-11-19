
import 'package:livee_manager/features/event/domain/repositories/event_repository.dart';

import '../entities/event_entity.dart';

class UpdateEvent {
  final EventRepository repository;

  UpdateEvent(this.repository);

  Future<EventEntity> call(EventEntity event) {
    return repository.updateEvent(event);
  }
}
