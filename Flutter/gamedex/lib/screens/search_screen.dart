import 'package:flutter/material.dart';
import 'package:gamedex/widgets/custom_bottom_navigation_bar.dart';
import 'package:gamedex/widgets/game_card.dart';
import 'package:gamedex/widgets/game_search_bar.dart';
import 'package:gamedex/widgets/game_search_overlay.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
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

      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            GameSearchOverlay(),
            SizedBox(height: 16),
            Expanded(
              child: Consumer<GameProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading)
                    return Center(child: CircularProgressIndicator());
                  if (provider.games.isEmpty)
                    return Center(child: Text('Nenhum jogo encontrado :\'('));

                  return GridView.builder(
                    padding: EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 2 / 4.5,
                    ),
                    itemCount: provider.games.length,
                    itemBuilder: (context, index) {
                      final game = provider.games[index];
                      return GameCard(game: game);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          if (_selectedIndex == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (_selectedIndex == 2) {
            Navigator.pushNamed(context, '/explore');
          }
        },
      ),
    );
  }
}
