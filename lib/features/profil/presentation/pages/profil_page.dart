import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/profile_entity.dart';
import '../controllers/profile_controller.dart';
import 'package:livee_manager/widgets/custom_appbar.dart';
import 'package:livee_manager/widgets/custom_bottom_navbar.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Provider.of<ProfileController>(context);

    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 4,
        onTap: (index) {
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
              Navigator.pushNamed(context, '/laporan');
              break;
          }
        },
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFFFF9E8),
            ],
          ),
        ),
        child: SafeArea(
          child: c.isLoading
              ? const Center(child: CircularProgressIndicator())
              : _buildProfileContent(c.profile!),
        ),
      ),
    );
  }

  Widget _buildProfileContent(ProfileEntity profile) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 12),

          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(profile.image),
          ),
          const SizedBox(height: 16),

          Text(
            profile.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            profile.role,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 24),

          // CARD PROFIL
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _info(Icons.email_outlined, "Email", profile.email),
                _divider(),
                _info(Icons.phone_outlined, "Nomor Handphone", profile.phone),
                _divider(),
                _info(Icons.person_outline, "Nama Pengguna", profile.name),
                _divider(),
                _info(Icons.work_outline, "Tugas / Posisi", profile.role),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Logout",
                          style: TextStyle(color: Colors.white),
                          ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7A8A10),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Edit Profil",
                          style: TextStyle(color: Colors.white),
                          ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          const SizedBox(height: 24),
          const Text(
            'Versi Aplikasi\n1.0.0',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _info(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.black87),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500)),
                Text(value,
                    style: const TextStyle(
                        fontSize: 14, color: Colors.black54)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      height: 1,
      color: Colors.black.withValues(alpha: 0.1),
    );
  }
}
