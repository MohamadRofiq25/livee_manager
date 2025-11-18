import 'package:livee_manager/features/home/domain/entities/summary_entity.dart';
import 'package:livee_manager/features/home/domain/repositories/home_repository.dart';

class GetMonthlySummary {
  final HomeRepository repository;

  GetMonthlySummary(this.repository);

  Future<SummaryEntity> call() async {
    return await repository.getMonthlySummary();
  }
}
