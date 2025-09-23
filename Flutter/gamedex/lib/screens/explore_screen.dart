import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gamedex/models/game.dart';
import 'package:gamedex/providers/game_provider.dart';
import 'package:gamedex/widgets/custom_app_bar.dart';
import 'package:gamedex/widgets/custom_drawer.dart';
import 'package:gamedex/widgets/game_container.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_bottom_navigation_bar.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedIndex = 2;

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
    List<Game> recommendedGames = gameProvider.getRecommendedGames();

    return Scaffold(
      appBar: CustomAppBar(title: "GameDex"),
      drawer: CustomDrawer(

      ),

      body: gameProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
      :  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Talvez você curta:", style: Theme.of(context).textTheme.headlineSmall),
          ),
          SizedBox(
            height: 325,
            child: CarouselSlider.builder(
              itemCount: recommendedGames.length,
              itemBuilder: (context, index, realIndex) {
                final game = recommendedGames[index];
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

      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (_selectedIndex == 0){
            Navigator.pushNamed(context, '/home');
          }
          else if (_selectedIndex == 1) {
            Navigator.pushNamed(context, '/search');
          }
        },
      ),
    );
  }
}
