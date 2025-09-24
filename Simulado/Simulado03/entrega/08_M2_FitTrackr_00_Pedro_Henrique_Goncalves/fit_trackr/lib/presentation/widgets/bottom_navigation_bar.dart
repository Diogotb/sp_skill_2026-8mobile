import 'package:fit_trackr/presentation/screens/activity_history_screen.dart';
import 'package:fit_trackr/presentation/screens/dashboard_screen.dart';
import 'package:fit_trackr/presentation/screens/diet_screen.dart';
import 'package:fit_trackr/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  List<Widget> pages = [DashboardScreen(), ActivityHistoryScreen(), DietScreen()]; //SearchScreen()

  void _onItemTapped(int index) {
    if (widget.currentIndex != index) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => pages[index]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/dashboard_outlined.svg',
            colorFilter: ColorFilter.mode(
              widget.currentIndex == 0 ? primaryColor : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/dashboard_filled.svg',
            colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
          ),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/history_outlined.svg',
            colorFilter: ColorFilter.mode(
              widget.currentIndex == 1 ? primaryColor : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/history_filled.svg',
            colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
          ),
          label: 'Histórico',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/salad_outlined.svg',
            colorFilter: ColorFilter.mode(
              widget.currentIndex == 2 ? primaryColor : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/salad_filled.svg',
            colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
          ),
          label: 'Alimentos',
        ),
        // BottomNavigationBarItem(
        //   icon: SvgPicture.asset(
        //     'assets/icons/search_outlined.svg',
        //     colorFilter: ColorFilter.mode(
        //       widget.currentIndex == 3 ? primaryColor : Colors.grey,
        //       BlendMode.srcIn,
        //     ),
        //   ),
        //   activeIcon: SvgPicture.asset(
        //     'assets/icons/search_filled.svg',
        //     colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
        //   ),
        //   label: 'Pesquisar',
        // ),
      ],
    );
  }
}
