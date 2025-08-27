import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gamedex/models/game.dart';
import 'package:gamedex/providers/game_provider.dart';
import 'package:gamedex/widgets/game_card.dart';

class GameSearchOverlay extends StatefulWidget {
  const GameSearchOverlay({super.key});

  @override
  State<GameSearchOverlay> createState() => _GameSearchOverlayState();
}

class _GameSearchOverlayState extends State<GameSearchOverlay> {
  final TextEditingController _controller = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  List<Game> _suggestions = [];

  void _updateOverlay() {
    _overlayEntry?.remove();

    if (_controller.text.isEmpty || _suggestions.isEmpty) return;

    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (overlayContext) {
        return Positioned(
          width: size.width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0, size.height + 5),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(8),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 200),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _suggestions.length > 5 ? 5 : _suggestions.length,
                  itemBuilder: (context, index) {
                    final game = _suggestions[index];
                    return ListTile(
                      title: Text(game.title),
                      onTap: () {
                        _controller.text = game.title;
                        Provider.of<GameProvider>(context, listen: false)
                            .searchGames(game.title);
                        _overlayEntry?.remove();
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);

    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Buscar jogos...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onChanged: (query) {
          provider.searchGames(query);
          setState(() {
            _suggestions = provider.games;
          });
          _updateOverlay();
        },
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }
}
