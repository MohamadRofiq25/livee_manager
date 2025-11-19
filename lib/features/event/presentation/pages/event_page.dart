import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/event_controller.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_bottom_navbar.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final controller = Provider.of<EventController>(context, listen: true);
      controller.loadEvents();
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const CustomAppBar(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              // already here
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Event yang akan datang',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

              // List horizontal — NOW from controller.events
              SizedBox(
                height: 250,
                child: Consumer<EventController>(
                  builder: (context, controller, _) {
                    if (controller.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (controller.error != null) {
                      return Center(child: Text('Error: ${controller.error}'));
                    }

                    if (controller.events.isEmpty) {
                      return const Center(child: Text('Tidak ada event'));
                    }

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.events.length,
                      itemBuilder: (context, index) {
                        final e = controller.events[index];
                        return _buildEventCardFromEntity(e);
                      },
                    );
                  },
                ),
              ),


              const SizedBox(height: 24),
              _buildActionButton(
                context,
                label: 'Tambahkan Client Baru',
                icon: Icons.add,
              ),
              const SizedBox(height: 12),
              _buildActionButton(
                context,
                label: 'Tambahkan Event Baru',
                icon: Icons.add,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // adaptasi _buildEventCard to accept entity while preserving UI design
  Widget _buildEventCardFromEntity(event) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Thumbnail event
          Container(
            height: 110,
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.play_circle_fill_rounded,
                color: Colors.red,
                size: 54,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            event.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Ordered by: ${event.orderedBy}',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            // format date sama seperti desain-mu: dd MMMM yyyy
            '${event.date.day.toString().padLeft(2,'0')} ${_monthName(event.date.month)} ${event.date.year}',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // bisa panggil navigator ke detail
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDDE3B8),
                foregroundColor: Colors.black87,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Detail...',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  String _monthName(int month) {
    const names = [
      '', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    return names[month];
  }

  Widget _buildActionButton(BuildContext context,
      {required String label, required IconData icon}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFDDE3B8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {}, // implementasi tambah client/event bisa memanggil controller
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  size: 18,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
