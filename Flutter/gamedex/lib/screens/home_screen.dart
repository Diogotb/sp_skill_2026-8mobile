import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gamedex/providers/game_provider.dart';
import 'package:gamedex/widgets/custom_app_bar.dart';
import 'package:gamedex/widgets/custom_bottom_navigation_bar.dart';
import 'package:gamedex/widgets/custom_drawer.dart';
import 'package:gamedex/widgets/game_container.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _debounce;

  int _selectedIndex = 0;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () {
      Provider.of<GameProvider>(context, listen: false).searchGamesInCollection(query);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GameProvider>(context, listen: false).loadGames();
    });
  }

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    final collectionGames = gameProvider.filteredCollectionGames;

    String getResultText(bool isSearching, int resultCount) {
      if (!isSearching) return "";
      if (resultCount == 0) return "Nenhum resultado encontrado";
      return "Resultados encontrados: $resultCount";
    }

    final resultText = getResultText(gameProvider.isSearching, collectionGames.length);

    return Scaffold(
      appBar: CustomAppBar(title: "GameDex"),
      drawer: CustomDrawer(

      ),
      body:
          gameProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Buscar jogo...",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: _onSearchChanged,
                    ),
                  ),

                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Minha Coleção",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (resultText.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        resultText,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  SizedBox(
                    height: 325,
                    child: CarouselSlider.builder(
                      itemCount: collectionGames.length,
                      itemBuilder: (context, index, realIndex) {
                        final game = collectionGames[index];
                        return GameContainer(game: game);
                      },
                      options: CarouselOptions(
                        height: 300,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.7,
                        aspectRatio: 16 / 9,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                      ),
                    ),
                  ),
                ],
              ),

      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: _selectedIndex, onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });

        if (_selectedIndex == 1){
          Navigator.pushNamed(context, '/search');
        } else if (_selectedIndex == 2){
          Navigator.pushNamed(context, '/explore');
        }
      },),
    );
  }
}
