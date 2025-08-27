import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_profile_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Consumer<UserProfileProvider>(
        builder: (_, provider, __) {
          final profile = provider.currentUserProfile;
          if (profile == null) return CircularProgressIndicator();
          return Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(value: profile.exp / 100),
              ),
              SizedBox(width: 8),
              Text(profile.level.toString()),
            ],
          );
        },
      )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
