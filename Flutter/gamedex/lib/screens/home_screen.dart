import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gamedex/providers/game_provider.dart';
import 'package:gamedex/widgets/custom_app_bar.dart';
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

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () {
      Provider.of<GameProvider>(context, listen: false).searchGames(query);
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
    final games = gameProvider.games;

    String getResultText(bool isSearching, int resultCount) {
      if (!isSearching) return "";
      if (resultCount == 0) return "Nenhum resultado encontrado";
      return "Resultados encontrados: $resultCount";
    }

    final resultText = getResultText(gameProvider.isSearching, games.length);

    return Scaffold(
      appBar: CustomAppBar(title: "GameDex"),
      drawer: CustomDrawer(
        userName: "Teste",
        userEmail: "teste@example.com",
        avatarUrl:
            "https://www.gravatar.com/avatar/3b3be63a4c2a439b013787725dfce802?d=identicon",
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
                      itemCount: gameProvider.games.length,
                      itemBuilder: (context, index, realIndex) {
                        final game = gameProvider.games[index];
                        return GameContainer(game: game);
                      },
                      options: CarouselOptions(
                        height: 300,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.7,
                        aspectRatio: 16 / 9,
                        initialPage: 0,
                        enableInfiniteScroll: !gameProvider.isSearching,
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}
