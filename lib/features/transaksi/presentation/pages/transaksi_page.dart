import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/transaction_controller.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_bottom_navbar.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({super.key});

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      Provider.of<TransactionController>(context, listen: false).loadTransactions();
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 2,
        onTap: _onNavTap,
      ),
      body: SafeArea(
        child: Consumer<TransactionController>(
          builder: (context, controller, _) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.error != null) {
              return Center(child: Text('Error: ${controller.error}'));
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // LIST TRANSAKSI DARI CONTROLLER
                  ...controller.transactions.map((t) {
                    return Column(
                      children: [
                        _buildSummaryCard(
                          icon: Icons.payment,
                          iconColor: Colors.green,
                          title: t.title,
                          amount: "Rp. ${t.amount}",
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }).toList(),

                  _buildAddButton(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onNavTap(int index) {
    switch (index) {
      case 0: Navigator.pushNamed(context, '/home'); break;
      case 1: Navigator.pushNamed(context, '/event'); break;
      case 2: break;
      case 3: Navigator.pushNamed(context, '/laporan'); break;
      case 4: Navigator.pushNamed(context, '/profil'); break;
    }
  }

  Widget _buildAddButton() {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(120),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF7A8A10),
          shape: const CircleBorder(),
          onPressed: () {},
          child: const Icon(Icons.add, size: 30, color: Colors.white),
        ),
      ),
    );
  }

  // UI TIDAK DIUBAH
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
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
