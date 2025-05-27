import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  CustomAppBar({this.title,super.key});

  @override
  Widget build(BuildContext context) {
    final String actualTitle = title ?? "MyApp";
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.colorScheme.primary,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      title: Text(actualTitle),
      centerTitle: true,
      leading: Builder(builder: (context) {
        return IconButton(onPressed: () {
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.menu, size: 40, color: Colors.white,));
      }),
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
