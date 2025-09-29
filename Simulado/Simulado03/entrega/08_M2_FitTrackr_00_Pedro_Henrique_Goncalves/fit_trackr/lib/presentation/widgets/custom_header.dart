import 'package:fit_trackr/auth/services/auth_service.dart';
import 'package:fit_trackr/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth/auth_provider.dart';

class CustomHeader extends StatelessWidget {
  final _authService = AuthService();
  final String label;

  CustomHeader({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final user = Provider.of<AuthProvider>(context).currentUser;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () async {
              await _authService.logout();
              Provider.of<AuthProvider>(context, listen: false).logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: Icon(Icons.logout),
          ),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            onPressed: () => themeProvider.toggleTheme(),
            icon: Icon(
              themeProvider.isDark ? Icons.dark_mode : Icons.light_mode,
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(user!.avatarUrl),
          ),
        ],
      ),
    );
  }
}
