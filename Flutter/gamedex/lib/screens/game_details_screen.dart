import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamedex/models/game.dart';
import 'package:gamedex/providers/game_provider.dart';
import 'package:gamedex/services/game_service.dart';
import 'package:gamedex/widgets/custom_app_bar.dart';
import 'package:gamedex/widgets/custom_bottom_navigation_bar.dart';
import 'package:gamedex/widgets/custom_drawer.dart';
import 'package:gamedex/widgets/review_list.dart';
import 'package:gamedex/widgets/star_rating.dart';
import 'package:provider/provider.dart';

import '../models/review.dart';
import '../providers/review_provider.dart';
import '../services/review_service.dart';
import '../services/user_service.dart';

class GameDetailsScreen extends StatefulWidget {
  Game game;
  GameDetailsScreen({required this.game, super.key});

  @override
  State<GameDetailsScreen> createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {

  @override
  void initState() {
    super.initState();
  }

  int? _selectedIndex = null;

  double rating = 2.5;
  TextEditingController _reviewController = TextEditingController();
  GameService gameService = GameService();

  @override
  Widget build(BuildContext context) {
    Game game = widget.game;
    final reviewProvider = Provider.of<ReviewProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(title: "GameDex"),
      drawer: CustomDrawer(
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Column(
                  children: [
                    Hero(
                      tag: game.id,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.network(
                          game.image,
                          width: double.infinity,
                          alignment: Alignment.topCenter,
                          height: MediaQuery.of(context).size.height * 0.5,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) =>
                                  const Center(child: Icon(Icons.error)),
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  game.title,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                game.genero,
                                style: Theme.of(context).textTheme.titleMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),

                          const SizedBox(height: 4),
                          Text(
                            "Nota: ${game.rating.toStringAsFixed(1)}",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            "Descrição",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            game.description,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 48),
              Text("Reviews", style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 8),
              Text(
                "Deixe sua marca, faça uma review",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  _showRatingModal(context);
                },
                child: TextField(
                  readOnly: true,
                  enabled: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.rate_review),
                    labelText: "O que você achou do jogo?",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ReviewList(gameId: game.id),
            ],
          ),
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
          } else if (_selectedIndex == 1) {
            Navigator.pushNamed(context, '/search');
          } else if (_selectedIndex == 2) {
            Navigator.pushNamed(context, '/explore');
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Consumer<GameProvider>(
            builder: (context, gameProvider, child) {
              final isInCollection = gameProvider.isInCollection(widget.game.id);

              return FloatingActionButton(
                heroTag: "CollectionFAB",
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: isInCollection
                      ? Icon(
                    Icons.delete_forever,
                    key: ValueKey('collection'),
                    color: Colors.redAccent,
                  )
                      : Icon(
                    Icons.add,
                    key: ValueKey('not_collection'),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                onPressed: () {
                  gameProvider.toggleCollection(widget.game.id);
                },
              );
            },
          ),
          const SizedBox(height: 8),
          Consumer<GameProvider>(
            builder: (context, gameProvider, child) {
              final isFavorite = gameProvider.isFavorite(widget.game.id);

              return FloatingActionButton(
                heroTag: "FavoriteFAB",
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: isFavorite
                      ? Icon(
                    Icons.favorite,
                    key: ValueKey('favorite'),
                    color: Colors.redAccent,
                  )
                      : Icon(
                    Icons.favorite_border_outlined,
                    key: ValueKey('not_favorite'),
                    color: Colors.redAccent,
                  ),
                ),
                onPressed: () {
                  gameProvider.toggleFavorite(widget.game.id);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void _showRatingModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        double tempRating = 3.0;
        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Escrevendo review",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    StarRating(
                      rating: tempRating,
                      onRatingChanged: (newRating) {
                        setState(() {
                          tempRating = newRating;
                        });
                        rating = newRating;
                      },
                    ),
                    const SizedBox(height: 16),

                    TextField(
                      maxLines: 4,
                      controller: _reviewController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        label: Row(
                          children: [
                            Icon(Icons.rate_review_outlined),
                            Text(
                              " Descreva o que você sentiu sobre esse jogo.",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))), backgroundColor: Theme.of(context).colorScheme.primaryContainer),
                        onPressed: _sendReview,
                        child: Text("Enviar"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _sendReview() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final newReview = Review(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      gameId: widget.game.id,
      userId: userId,
      text: _reviewController.text.trim(),
      rating: rating,
      createdAt: DateTime.now(),
    );

    final reviewProvider = Provider.of<ReviewProvider>(context, listen: false);
    await reviewProvider.addReview(newReview);

    Navigator.of(context).pop();
  }

}
