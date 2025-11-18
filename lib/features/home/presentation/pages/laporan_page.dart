import 'package:flutter/material.dart';
import 'package:livee_manager/widgets/custom_appbar.dart';
import 'package:livee_manager/widgets/custom_bottom_navbar.dart';

class LaporanPage extends StatelessWidget {
  const LaporanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 3, // halaman yang sedang aktif
        onTap: (index) {
          // Navigasi berdasarkan index
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/event');
              break;
            case 2:
              Navigator.pushNamed(context, '/transaksi');
              break;
            case 3:
              //sudah di halaman laporan
              break;
            case 4:
              Navigator.pushNamed(context, '/profil');
              break;
          }
        },
      ),
      body: const Center(
        child: Text('Selamat datang di halaman Laporan!'),
      ),
    );
  }
}