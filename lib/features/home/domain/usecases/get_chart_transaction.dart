import 'package:livee_manager/features/home/domain/entities/chart_entity.dart';
import 'package:livee_manager/features/home/domain/repositories/home_repository.dart';

class GetChartTransaction {
  final HomeRepository repository;

  GetChartTransaction(this.repository);

  Future<List<ChartEntity>> call() async {
    return await repository.getChartTransaction();
  }
}
