import 'package:artgallery_explorer/controllers/exhibition_controller.dart';
import 'package:artgallery_explorer/models/exhibition.dart';
import 'package:artgallery_explorer/theme/app_colors.dart';
import 'package:artgallery_explorer/widgets/custom_navigation_rail.dart';
import 'package:flutter/material.dart';

class ExhibitionDetailsPage extends StatefulWidget {
  final int exhibitionId;
  const ExhibitionDetailsPage({super.key, required this.exhibitionId});

  @override
  State<ExhibitionDetailsPage> createState() => _ExhibitionDetailsPageState();
}

class _ExhibitionDetailsPageState extends State<ExhibitionDetailsPage> {
  final ExhibitionController _artworkController = ExhibitionController();
  Exhibition exhibition = Exhibition(
    id: 0,
    title: '',
    gallery: '',
    startDate: '',
    endDate: '',
    status: '',
    description: '',
    bannerUrl: '',
    artworkIds: [],
  );
  bool _isLoading = true;

  Future<void> loadExhibitionData() async {
    setState(() => _isLoading = true);
    try {
      exhibition = await _artworkController.fetchExhibitionById(
        widget.exhibitionId,
      );
    } catch (e) {
      print(e);
    }
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    loadExhibitionData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CustomNavigationRail(selectedIndex: 2),
          Expanded(
            child:
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            exhibition.bannerUrl,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.5,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    const Icon(Icons.broken_image, size: 100),
                          ),
                          Container(
                            height: 179,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            decoration: BoxDecoration(
                              color: AppColors.accentDark,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  exhibition.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(color: Colors.white),
                                ),
                                Text(
                                  "Datas: ${exhibition.startDate} Até ${exhibition.endDate}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.accentLight,
                            ),
                            padding: const EdgeInsets.all(24),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Obras em Exposição",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(color: Colors.white),
                                      ),
                                      const SizedBox(height: 12),
                                      Expanded(
                                        child: GridView.builder(
                                          itemCount:
                                              exhibition.artworkIds.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4,
                                                crossAxisSpacing: 12,
                                                mainAxisSpacing: 12,
                                                childAspectRatio: 0.75,
                                              ),
                                          itemBuilder: (context, index) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Obra #${exhibition.artworkIds[index]}",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Descrição",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(color: Colors.white),
                                      ),
                                      const SizedBox(height: 12),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Text(
                                            exhibition.description,
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
