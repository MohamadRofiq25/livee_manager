import 'package:livee_manager/features/home/domain/entities/event_entity.dart';
import 'package:livee_manager/features/home/domain/repositories/home_repository.dart';

class GetUpcomingEvents {
  final HomeRepository repository;

  GetUpcomingEvents(this.repository);

  Future<List<EventEntity>> call() async {
    return await repository.getUpcomingEvents();
  }
}
