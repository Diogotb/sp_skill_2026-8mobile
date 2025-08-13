import 'package:flutter/material.dart';
import 'package:gamedex/models/game.dart';
import 'package:gamedex/services/game_service.dart';
import 'package:gamedex/widgets/custom_app_bar.dart';
import 'package:gamedex/widgets/custom_bottom_navigation_bar.dart';
import 'package:gamedex/widgets/custom_drawer.dart';

class GameDetailsScreen extends StatefulWidget {
  Game game;
  GameDetailsScreen({required this.game, super.key});

  @override
  State<GameDetailsScreen> createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {
  late bool isFavorite;
  late bool isOnCollection;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.game.isFavorite;
    isOnCollection = widget.game.inCollection;
  }

  int? _selectedIndex = null;

  GameService gameService = GameService();
  @override
  Widget build(BuildContext context) {
    Game game = widget.game;
    return Scaffold(
      appBar: CustomAppBar(title: "GameDex"),
      drawer: CustomDrawer(
        userName: "Teste",
        userEmail: "teste@example.com",
        avatarUrl:
            "https://www.gravatar.com/avatar/3b3be63a4c2a439b013787725dfce802?d=identicon",
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
                                  style: Theme.of(context).textTheme.titleMedium,
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
                          const SizedBox(height: 24,),
                          Text("Descrição", style: Theme.of(context).textTheme.titleMedium,),
                          const SizedBox(height: 8,),
                          Text(game.description, style: Theme.of(context).textTheme.bodySmall,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 48,),
              Text("Reviews", style: Theme.of(context).textTheme.titleMedium,),

              SizedBox(height: 12,),

        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: game.reviews.length,
          itemBuilder: (context, index) {
            final review = game.reviews[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(review['user']![0]),
              ),
              title: Text(review['user']!),
              subtitle: Text(review['comment']!),
            );
          },
        ),
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
          FloatingActionButton(
            heroTag: "CollectionFAB",
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: isOnCollection
                  ? Icon(Icons.delete_forever, key:ValueKey('collection'), color: Colors.redAccent)
                  : Icon(Icons.add, key: ValueKey('not_collection'), color: Theme.of(context).colorScheme.primary),
            ),
            onPressed: () {
              setState(() {
                isOnCollection = !isOnCollection;
                gameService.toggleCollection(game.id, isOnCollection);
              });
            },),
          const SizedBox(height: 8,),
          FloatingActionButton(
            heroTag: "FavoriteFAB",
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: isFavorite
                  ? Icon(Icons.favorite, key: ValueKey('favorite'), color: Colors.redAccent)
                  : Icon(Icons.favorite_border_outlined, key: ValueKey('not_favorite'), color: Colors.redAccent),
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
                gameService.toggleFavorite(game.id, isFavorite);
              });
          },),
        ],
      ),
    );
  }
}
