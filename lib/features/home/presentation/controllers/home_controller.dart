import 'package:flutter/material.dart';
import 'package:livee_manager/features/home/domain/entities/chart_entity.dart';
import 'package:livee_manager/features/home/domain/entities/event_entity.dart';
import 'package:livee_manager/features/home/domain/entities/summary_entity.dart';
import 'package:livee_manager/features/home/domain/usecases/get_chart_transaction.dart';
import 'package:livee_manager/features/home/domain/usecases/get_monthly_summary.dart';
import 'package:livee_manager/features/home/domain/usecases/get_upcoming_events.dart';

class HomeController extends ChangeNotifier {
  final GetMonthlySummary getMonthlySummary;
  final GetUpcomingEvents getUpcomingEvents;
  final GetChartTransaction getChartTransaction;

  SummaryEntity? summary;
  List<EventEntity> events = [];
  List<ChartEntity> charts = [];

  bool loadingSummary = false;
  bool loadingEvents = false;
  bool loadingChart = false;

  HomeController(
    this.getMonthlySummary,
    this.getUpcomingEvents,
    this.getChartTransaction,
  );

  Future<void> loadSummary() async {
    loadingSummary = true;
    notifyListeners();

    summary = await getMonthlySummary();

    loadingSummary = false;
    notifyListeners();
  }

  Future<void> loadEvents() async {
    loadingEvents = true;
    notifyListeners();

    events = await getUpcomingEvents();

    loadingEvents = false;
    notifyListeners();
  }

  Future<void> loadChart() async {
    loadingChart = true;
    notifyListeners();

    charts = await getChartTransaction();

    loadingChart = false;
    notifyListeners();
  }
}
