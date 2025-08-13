import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int? currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Widget _buildNavIcon({
    required String outline,
    required String filled,
    required bool selected,
    required BuildContext context,
  }) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (child, animation) =>
          ScaleTransition(scale: animation, child: child),
      child: SvgPicture.asset(
        selected ? filled : outline,
        key: ValueKey<bool>(selected),
        width: 20,
        height: 20,
        color: selected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex ?? 0,
        selectedLabelStyle:TextStyle(color: Theme.of(context).colorScheme.primary) ,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              outline: 'assets/icons/home_outline.svg',
              filled: 'assets/icons/home_filled.svg',
              selected: currentIndex == 0,
              context: context,
            ),
            label: "Home",

          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              outline: 'assets/icons/search_outline.svg',
              filled: 'assets/icons/search_filled.svg',
              selected: currentIndex == 1,
              context: context,
            ),
            label: "Buscar",
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              outline: 'assets/icons/controller_outline.svg',
              filled: 'assets/icons/controller_filled.svg',
              selected: currentIndex == 2,
              context: context,
            ),
            label: "Explorar",
          ),
        ],
      ),
    );
  }
}
