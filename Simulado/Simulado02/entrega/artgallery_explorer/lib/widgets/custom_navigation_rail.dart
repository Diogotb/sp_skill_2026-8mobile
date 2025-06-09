import 'package:flutter/material.dart';

class CustomNavigationRail extends StatefulWidget {
  final int selectedIndex;
  const CustomNavigationRail({super.key, required this.selectedIndex});

  @override
  State<CustomNavigationRail> createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  double groupAlignment = -1;

  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: NavigationRail(
        elevation: 1,
        indicatorColor: Colors.transparent,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedIndex: widget.selectedIndex,
        groupAlignment: -0.9,
        onDestinationSelected: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/artists');
              break;
            case 2:
              Navigator.pushNamed(context, '/exhibitions');
              break;
            case 3:
              Navigator.pushNamed(context, '/collection');
              break;
            case 4:
              Navigator.pushNamed(context, '/favorites');
              break;
            case 5:
              Navigator.pushNamed(context, '/settings');
              break;
          }
        },
        labelType: labelType,
        destinations: <NavigationRailDestination>[
          NavigationRailDestination(
            icon: Icon(
              Icons.explore,
              size: 60,
              color: Theme.of(context).colorScheme.secondary,

            ),
            selectedIcon: Icon(
              Icons.explore,
              size: 60,
              color: Colors.white70,
            ),
            label: Text(
              'Explorar',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          NavigationRailDestination(
            icon: Icon(
              Icons.color_lens,
              size: 60,
              color: Theme.of(context).colorScheme.secondary,
            ),
            selectedIcon: Icon(
              Icons.color_lens,
              size: 60,
              color: Colors.white70,
            ),
            label: Text(
              'Artistas',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          NavigationRailDestination(
            icon: Icon(
              Icons.filter_frames,
              size: 60,
              color: Theme.of(context).colorScheme.secondary
            ),
            selectedIcon: Icon(
              Icons.filter_frames,
              size: 60,
              color: Colors.white70,
            ),
            label: Text(
              'Exposições',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          NavigationRailDestination(
            icon: Icon(
              Icons.collections,
              size: 60,
              color: Theme.of(context).colorScheme.secondary,
            ),
            selectedIcon: Icon(
              Icons.collections,
              size: 60,
              color: Colors.white70,
            ),
            label: Text(
              'Minha Coleção',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          NavigationRailDestination(
            icon: Icon(
              Icons.favorite,
              size: 60,
              color: Theme.of(context).colorScheme.secondary,
            ),
            selectedIcon: Icon(
              Icons.favorite,
              size: 60,
              color: Colors.white70,
            ),
            label: Text(
              'Favoritos',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          NavigationRailDestination(
            icon: Icon(
              Icons.settings,
              size: 60,
              color: Theme.of(context).colorScheme.secondary,
            ),
            selectedIcon: Icon(
              Icons.settings,
              size: 60,
              color: Colors.white70,
            ),
            label: Text(
              'Configurações',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }
}
