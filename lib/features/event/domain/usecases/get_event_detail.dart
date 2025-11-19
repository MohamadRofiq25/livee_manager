import 'package:livee_manager/features/event/domain/repositories/event_repository.dart';
import '../entities/event_entity.dart';

class GetEventDetail {
  final EventRepository repository;

  GetEventDetail(this.repository);

  Future<EventEntity?> call(String id) {
    return repository.getEventById(id);
  }
}
