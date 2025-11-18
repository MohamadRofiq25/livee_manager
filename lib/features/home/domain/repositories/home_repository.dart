import 'package:livee_manager/features/home/domain/entities/chart_entity.dart';
import 'package:livee_manager/features/home/domain/entities/event_entity.dart';
import 'package:livee_manager/features/home/domain/entities/summary_entity.dart';

abstract class HomeRepository {
  Future<SummaryEntity> getMonthlySummary();
  Future<List<EventEntity>> getUpcomingEvents();
  Future<List<ChartEntity>> getChartTransaction();
}
