import 'package:livee_manager/features/home/data/datasources/home_remote_datasource.dart';
import 'package:livee_manager/features/home/domain/entities/chart_entity.dart';
import 'package:livee_manager/features/home/domain/entities/event_entity.dart';
import 'package:livee_manager/features/home/domain/entities/summary_entity.dart';
import 'package:livee_manager/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<SummaryEntity> getMonthlySummary() {
    return dataSource.fetchMonthlySummary();
  }

  @override
  Future<List<EventEntity>> getUpcomingEvents() {
    return dataSource.fetchUpcomingEvents();
  }

  @override
  Future<List<ChartEntity>> getChartTransaction() {
    return dataSource.fetchChartTransaction();
  }
}
