import 'package:artgallery_explorer/controllers/artwork_controller.dart';
import 'package:artgallery_explorer/models/artwork.dart';
import 'package:artgallery_explorer/theme/app_colors.dart';
import 'package:artgallery_explorer/widgets/custom_navigation_rail.dart';
import 'package:flutter/material.dart';

class ArtworkDetailsPage extends StatefulWidget {
  final int artworkId;
  const ArtworkDetailsPage({super.key, required this.artworkId});

  @override
  State<ArtworkDetailsPage> createState() => _ArtworkDetailsPageState();
}

class _ArtworkDetailsPageState extends State<ArtworkDetailsPage> {
  final ArtworkController _artworkController = ArtworkController();
  Artwork artwork = Artwork(
    title: '',
    artistId: 0,
    year: '',
    technique: '',
    dimensions: '',
    description: '',
    gallery: '',
    imageUrl: '',
    isFeatured: false,
  );
  bool _isLoading = true;

  Future<void> loadArtworkData() async {
    setState(() => _isLoading = true);
    try {
      artwork = await _artworkController.fetchArtworkById(widget.artworkId);
    } catch (e) {
      print(e);
    }
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    loadArtworkData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNavigationRail(selectedIndex: 0),
            const SizedBox(width: 32),

            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    artwork.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "ID do Artista: ${artwork.artistId}",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Ano: ${artwork.year}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Técnica: ${artwork.technique}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "Sobre a obra",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    artwork.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 10,
                        backgroundColor: AppColors.accentLight,
                      ),
                      onPressed: () {

                      },
                      child: const Text(
                        "Adicionar à coleção",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 32),


            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Image.network(
                    artwork.imageUrl,
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    artwork.dimensions,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
