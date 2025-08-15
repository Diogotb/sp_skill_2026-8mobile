import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gamedex/providers/game_provider.dart';
import 'package:gamedex/models/game.dart';

class GameSearchBar extends StatefulWidget {
  const GameSearchBar({super.key});

  @override
  State<GameSearchBar> createState() => _GameSearchBarState();
}

class _GameSearchBarState extends State<GameSearchBar> {
  final TextEditingController _controller = TextEditingController();
  List<Game> _suggestions = [];

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Buscar jogos...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onChanged: (query) {
            gameProvider.searchGames(query);
            setState(() {
              _suggestions = gameProvider.games;
            });
          },
        ),
        // Sugestões
        if (_controller.text.isNotEmpty)
          Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            constraints: BoxConstraints(maxHeight: 200),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                final game = _suggestions[index];
                return ListTile(
                  title: Text(game.title),
                  subtitle: Text(game.genero),
                  onTap: () {
                    _controller.text = game.title;
                    gameProvider.searchGames(game.title);
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}
