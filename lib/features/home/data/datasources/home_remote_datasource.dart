import 'package:livee_manager/features/home/data/models/chart_model.dart';
import 'package:livee_manager/features/home/data/models/event_model.dart';
import 'package:livee_manager/features/home/data/models/summary_model.dart';

abstract class HomeRemoteDataSource {
  Future<SummaryModel> fetchMonthlySummary();
  Future<List<EventModel>> fetchUpcomingEvents();
  Future<List<ChartModel>> fetchChartTransaction();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<SummaryModel> fetchMonthlySummary() async {
    return SummaryModel(
      pemasukan: 15000000,
      pengeluaran: 6500000,
    );
  }

  @override
  Future<List<EventModel>> fetchUpcomingEvents() async {
    return [
      EventModel(
        id: "1",
        title: "Live Streaming Wedding",
        date: DateTime.now().add(Duration(days: 1)),
      ),
      EventModel(
        id: "2",
        title: "Shooting Company Profile",
        date: DateTime.now().add(Duration(days: 3)),
      ),
    ];
  }

  @override
  Future<List<ChartModel>> fetchChartTransaction() async {
    return [
      ChartModel(label: "Jan", pemasukan: 10, pengeluaran: 5),
      ChartModel(label: "Feb", pemasukan: 20, pengeluaran: 12),
      ChartModel(label: "Mar", pemasukan: 18, pengeluaran: 8),
    ];
  }
}
