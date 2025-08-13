import 'package:flutter/material.dart';
import 'package:gamedex/widgets/custom_bottom_navigation_bar.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "GameDex"),
      drawer: CustomDrawer(
        userName: "Teste",
        userEmail: "teste@example.com",
        avatarUrl:
        "https://www.gravatar.com/avatar/3b3be63a4c2a439b013787725dfce802?d=identicon",
      ),

      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: _selectedIndex, onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });

        if (_selectedIndex == 0){
          Navigator.pushNamed(context, '/home');
        } else if (_selectedIndex == 2){
          Navigator.pushNamed(context, '/explore');
        }
      },),
    );
  }
}
