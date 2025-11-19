import 'package:flutter/material.dart';
import 'package:livee_manager/widgets/custom_appbar.dart';
import 'package:livee_manager/widgets/custom_bottom_navbar.dart';

class TransaksiPage extends StatelessWidget {
  const TransaksiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 2, // halaman yang sedang aktif
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
              // sudah di halaman transaksi
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
              _buildSummaryCard(
                icon: Icons.payment,
                iconColor: Colors.green,
                title: 'Ujungmanik Berholawat',
                amount: 'Rp. 1.500.000',
              ),
              const SizedBox(height: 20),
              _buildSummaryCard(
                icon: Icons.payment,
                iconColor: Colors.green,
                title: 'Wedding Rina & Roni',
                amount: 'Rp. 2.000.000',
              ),
              const SizedBox(height: 20),
              _buildSummaryCard(
                icon: Icons.payment,
                iconColor: Colors.green,
                title: 'Pengajian Akbar Bersama Gus Iqdam',
                amount: 'Rp. 3.000.000',
              ),
              

              // Tombol tambah (+)
            Center(
              child: Container(
                margin: EdgeInsets.all(120),
                child: FloatingActionButton(
                  backgroundColor: const Color(0xFF7A8A10),
                  shape: const CircleBorder(),
                  onPressed: () {
                    
                  },
                  child: const Icon(Icons.add, size: 30, color: Colors.white),
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }

   // Summary card
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
                Text(
                  title,
                  style: const TextStyle(fontSize: 13),
                ),
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

}