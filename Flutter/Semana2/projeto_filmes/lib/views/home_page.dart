import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projeto_filmes/controller/filme_controller.dart';
import 'package:projeto_filmes/model/filme.dart';
import 'package:projeto_filmes/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Filme>> futureFilmes;
  late Future<List<Filme>> mostRatedFilmes;
  FilmeController filmeController = FilmeController();
  final CarouselSliderController _posterController = CarouselSliderController();
  final CarouselSliderController _titleController = CarouselSliderController();

  @override
  void initState() {
    super.initState();
    futureFilmes = filmeController.getFilmes();
    mostRatedFilmes = filmeController.getMostRated();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.57,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Positioned(
                    top: 0,
                    child: Material(
                      elevation: 20,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: FutureBuilder<List<Filme>>(
                          future: futureFilmes,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final List<String?> posterPaths =
                                  snapshot.data!
                                      .map<String?>((filme) => filme.posterPath)
                                      .toList();

                              return CarouselSlider(
                                carouselController: _posterController,
                                items:
                                    posterPaths.map((posterPath) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return Container(
                                            color: Colors.black,
                                            child: Image.network(
                                              'https://image.tmdb.org/t/p/w500$posterPath',
                                              width:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        },
                                      );
                                    }).toList(),
                                options: CarouselOptions(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 1,
                                  initialPage: 0,
                                  enableInfiniteScroll: false,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration: Duration(
                                    milliseconds: 800,
                                  ),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    _titleController.animateToPage(
                                      index,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }

                            return const CircularProgressIndicator();
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    child: Material(
                      elevation: 10,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Destaques Recentes:",
                                style: Theme.of(context).textTheme.headlineLarge
                                    ?.copyWith(color: AppColors.primary600),
                              ),
                              SizedBox(height: 8),
                              SizedBox(
                                height: 24,
                                child: FutureBuilder<List<Filme>>(
                                  future: futureFilmes,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final List<String?> movieTitles =
                                          snapshot.data!
                                              .map<String?>(
                                                (filme) => filme.title,
                                              )
                                              .toList();
                                      return CarouselSlider(
                                        carouselController: _titleController,

                                        items:
                                            movieTitles.map((title) {
                                              return Builder(
                                                builder: (
                                                  BuildContext context,
                                                ) {
                                                  return Text(
                                                    title ?? 'Sem Título',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineLarge
                                                        ?.copyWith(
                                                          color:
                                                              AppColors
                                                                  .primary600,
                                                        ),
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  );
                                                },
                                              );
                                            }).toList(),
                                        options: CarouselOptions(
                                          height: 24,
                                          viewportFraction: 1,
                                          initialPage: 0,
                                          enableInfiniteScroll: true,
                                          reverse: false,
                                          autoPlay: true,
                                          autoPlayInterval: Duration(
                                            seconds: 3,
                                          ),
                                          autoPlayAnimationDuration: Duration(
                                            milliseconds: 500,
                                          ),
                                          autoPlayCurve: Curves.linear,
                                          scrollDirection: Axis.horizontal,
                                          onPageChanged: (index, reason) {
                                            _posterController.animateToPage(
                                              index,
                                              duration: Duration(
                                                milliseconds: 300,
                                              ),
                                              curve: Curves.easeInOut,
                                            );
                                          },
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text("Erro ao carregar títulos");
                                    }
                                    return const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Descubra seu Próximo Favorito",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppColors.complementary300,
                fontSize: 26,
              ),
            ),
            SizedBox(height: 12),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    AppColors.complementary300,
                    AppColors.complementary200,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
              ),
              child: FutureBuilder<List<Filme>>(
                future: mostRatedFilmes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<String?> posterPaths =
                    snapshot.data!
                        .map<String?>((filme) => filme.posterPath)
                        .toList();

                    return CarouselSlider(
                      items:
                      posterPaths.map((posterPath) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500$posterPath',
                                width:
                                MediaQuery.of(
                                  context,
                                ).size.width,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 150,
                        viewportFraction: 0.3,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(
                          milliseconds: 800,
                        ),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
