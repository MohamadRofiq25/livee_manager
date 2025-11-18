import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_bottom_navbar.dart';
import '../controllers/home_controller.dart';
import '../../domain/entities/chart_entity.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);

    // Load otomatis jika belum pernah dipanggil
    if (!controller.loadingSummary && controller.summary == null) {
      controller.loadSummary();
    }
    if (!controller.loadingEvents && controller.events.isEmpty) {
      controller.loadEvents();
    }
    if (!controller.loadingChart && controller.charts.isEmpty) {
      controller.loadChart();
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),

      appBar: const CustomAppBar(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 1:
              Navigator.pushNamed(context, '/event');
              break;
            case 2:
              Navigator.pushNamed(context, '/transaksi');
              break;
            case 3:
              Navigator.pushNamed(context, '/laporan');
              break;
            case 4:
              Navigator.pushNamed(context, '/profil');
              break;
          }
        },
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // ============================
              //       SUMMARY DINAMIS
              // ============================
              controller.loadingSummary
                  ? const Center(child: CircularProgressIndicator())
                  : _buildSummaryCard(
                      icon: Icons.add_circle_outline,
                      iconColor: Colors.green,
                      title: 'Total Pemasukan Bulan Ini',
                      amount: controller.summary != null
                          ? NumberFormat.currency(
                              locale: 'id_ID',
                              symbol: 'Rp ',
                              decimalDigits: 0,
                            ).format(controller.summary!.pemasukan)
                          : 'Rp 0',
                    ),

              const SizedBox(height: 12),

              controller.loadingSummary
                  ? const SizedBox()
                  : _buildSummaryCard(
                      icon: Icons.remove_circle_outline,
                      iconColor: Colors.red,
                      title: 'Total Pengeluaran Bulan Ini',
                      amount: controller.summary != null
                          ? NumberFormat.currency(
                              locale: 'id_ID',
                              symbol: 'Rp ',
                              decimalDigits: 0,
                            ).format(controller.summary!.pengeluaran)
                          : 'Rp 0',
                    ),

              const SizedBox(height: 12),

              // ============================
              //       EVENT DINAMIS
              // ============================
              controller.loadingEvents
                  ? const Center(child: CircularProgressIndicator())
                  : controller.events.isEmpty
                      ? _buildEventCard(
                          eventName: "Tidak ada event berjalan",
                          date: "-",
                        )
                      : _buildEventCard(
                          eventName: controller.events.first.title,
                          date: DateFormat('dd MMMM yyyy', 'id_ID')
                              .format(controller.events.first.date),
                        ),

              const SizedBox(height: 20),

              // ============================
              //         CHART DINAMIS
              // ============================
              controller.loadingChart
                  ? const Center(child: CircularProgressIndicator())
                  : _buildChartCard(charts: controller.charts),
            ],
          ),
        ),
      ),
    );
  }

  // ================================================================
  //                         SUMMARY CARD
  // ================================================================
  Widget _buildSummaryCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String amount,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 40),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 13)),
                const SizedBox(height: 4),
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  //                          EVENT CARD
  // ================================================================
  Widget _buildEventCard({
    required String eventName,
    required String date,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.event_note, color: Colors.blue, size: 40),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Event Berjalan', style: TextStyle(fontSize: 13)),
                const SizedBox(height: 4),
                Text(
                  eventName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  //                           CHART CARD
  // ================================================================
  Widget _buildChartCard({required List<ChartEntity> charts}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ChartLegend(color: Colors.lime, text: 'Pemasukan'),
              SizedBox(width: 16),
              _ChartLegend(color: Colors.pinkAccent, text: 'Pengeluaran'),
            ],
          ),
          const SizedBox(height: 16),

          SizedBox(
            height: 250,
            child: BarChart(
              BarChartData(
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.withValues(alpha: 0.3),
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          charts[value.toInt()].label,
                          style: const TextStyle(fontSize: 10),
                        );
                      },
                    ),
                  ),
                ),
                barGroups: charts.map((chart) {
                  return BarChartGroupData(
                    x: charts.indexOf(chart),   // index posisi
                    barRods: [
                      BarChartRodData(
                        toY: chart.pemasukan.toDouble(),
                        color: Colors.lime,
                        width: 10,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      BarChartRodData(
                        toY: chart.pengeluaran.toDouble(),
                        color: Colors.pinkAccent,
                        width: 10,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  );
                }).toList(),

              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
//                     CHART LEGEND WIDGET
// ================================================================
class _ChartLegend extends StatelessWidget {
  final Color color;
  final String text;

  const _ChartLegend({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 16, height: 8, color: color),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
