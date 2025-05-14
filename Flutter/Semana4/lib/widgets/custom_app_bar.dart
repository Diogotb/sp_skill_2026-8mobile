import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.primaryColor,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      title: Text("MyNotes"),
      centerTitle: true,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15, bottom: 15),
          child: Image.asset('assets/images/logo.png'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
