import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    final user = authService.currentUser;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'), // Placeholder
              ),
              const SizedBox(height: 10),
              Text(
                user?.email ?? "No Email",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text("Digital Nomad", style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(),
          _buildProfileOption(icon: EvaIcons.personOutline, title: "Account Details"),
          _buildProfileOption(icon: EvaIcons.settingsOutline, title: "Settings"),
          _buildProfileOption(icon: EvaIcons.bellOutline, title: "Notifications"),
          const Divider(),
          _buildProfileOption(
            icon: EvaIcons.logOutOutline,
            title: "Log Out",
            isLogout: true,
            onTap: () {
              authService.signOut();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption({required IconData icon, required String title, bool isLogout = false, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.redAccent : Colors.black54),
      title: Text(title, style: TextStyle(color: isLogout ? Colors.redAccent : Colors.black87, fontWeight: FontWeight.w500)),
      trailing: isLogout ? null : const Icon(EvaIcons.arrowIosForwardOutline, size: 18),
      onTap: onTap,
    );
  }
}