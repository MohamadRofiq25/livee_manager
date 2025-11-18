import 'package:flutter/material.dart';
import 'package:livee_manager/features/home/data/datasources/home_remote_datasource.dart';
import 'package:livee_manager/features/home/data/repositories/home_repository_impl.dart';
import 'package:livee_manager/features/home/domain/usecases/get_chart_transaction.dart';
import 'package:livee_manager/features/home/domain/usecases/get_monthly_summary.dart';
import 'package:livee_manager/features/home/domain/usecases/get_upcoming_events.dart';
import 'package:livee_manager/features/home/presentation/controllers/home_controller.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';


import 'features/home/presentation/pages/login_page.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/home/presentation/pages/event_page.dart';
import 'features/home/presentation/pages/transaksi_page.dart';
import 'features/home/presentation/pages/laporan_page.dart';
import 'features/home/presentation/pages/profil_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeController(
            GetMonthlySummary(HomeRepositoryImpl(HomeRemoteDataSourceImpl())),
            GetUpcomingEvents(HomeRepositoryImpl(HomeRemoteDataSourceImpl())),
            GetChartTransaction(HomeRepositoryImpl(HomeRemoteDataSourceImpl())),
          ),
        ),

    // tambahkan controller fitur lain
  ],
  child: LiveeManager(),
)
);

}

class LiveeManager extends StatelessWidget {
  const LiveeManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Creative Media Cilacap',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/event': (context) => const EventPage(),
        '/transaksi': (context) => const TransaksiPage(),
        '/laporan': (context) => const LaporanPage(),
        '/profil': (context) => const ProfilPage(),
      },
    );
  }
}