import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String avatarUrl;

  const CustomDrawer({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorScheme.surface, // em vez de cinza/black fixo
              colorScheme.background,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(context, colorScheme),
              Divider(color: colorScheme.onSurface.withOpacity(0.2), height: 1, thickness: 0.5),
              Expanded(child: _buildMenuItems(context, colorScheme)),
              Divider(color: colorScheme.onSurface.withOpacity(0.2), height: 1, thickness: 0.5),
              _buildFooter(context, colorScheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ColorScheme colorScheme) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withOpacity(0.2),
            blurRadius: 12,
            offset: Offset(0, 3),
          )
        ],
        border: Border.all(color: colorScheme.onSurface.withOpacity(0.12)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 38,
            backgroundImage: NetworkImage(avatarUrl),
            backgroundColor: colorScheme.primaryContainer,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                    letterSpacing: 0.5,
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: colorScheme.onSurface.withOpacity(0.6),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  userEmail,
                  style: TextStyle(
                    fontSize: 14,
                    color: colorScheme.onSurface.withOpacity(0.75),
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context, ColorScheme colorScheme) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _drawerItem(
          context,
          icon: Icons.home,
          label: "Home",
          colorScheme: colorScheme,
          onTap: () {
            Navigator.pushNamed(context, "/home");
          },
        ),
        _drawerItem(
          context,
          icon: Icons.favorite,
          label: "Favoritos",
          colorScheme: colorScheme,
          onTap: () {
            // TODO: Navegação
          },
        ),
        _drawerItem(
          context,
          icon: Icons.settings,
          label: "Configurações",
          colorScheme: colorScheme,
          onTap: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
        _drawerItem(
          context,
          icon: Icons.info,
          label: "Sobre",
          colorScheme: colorScheme,
          onTap: () {
            // TODO: Navegação
          },
        ),
      ],
    );
  }

  Widget _drawerItem(BuildContext context,
      {required IconData icon,
        required String label,
        required ColorScheme colorScheme,
        required VoidCallback onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      splashColor: colorScheme.primary.withOpacity(0.3),
      hoverColor: colorScheme.primary.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: colorScheme.onSurface.withOpacity(0.7), size: 26),
            const SizedBox(width: 24),
            Text(
              label,
              style: TextStyle(
                color: colorScheme.onSurface.withOpacity(0.7),
                fontSize: 17,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Text(
        "© 2025 Gamedex",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: colorScheme.onSurface.withOpacity(0.5),
          fontSize: 13,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
