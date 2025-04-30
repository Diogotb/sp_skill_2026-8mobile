import 'package:flutter/material.dart';
import 'package:projeto_filmes/controller/filme_controller.dart';
import 'package:projeto_filmes/model/filme.dart';

import '../theme/app_colors.dart';

class DetalhesPage extends StatefulWidget {
  const DetalhesPage({super.key});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  final FilmeController _filmeController = FilmeController();
  int? _filmeId;
  Future<Filme?>? _filmeFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is Map<String, dynamic> && arguments.containsKey('filmeId')) {
      _filmeId = arguments['filmeId'] as int?;
      if (_filmeId != null) {
        _filmeFuture = _filmeController.getFilmById(_filmeId!);
      } else {
        print("Error: filmeId is null.");
        _filmeFuture = Future.value(null);
      }
    } else {
      print("Error: Expected a Map with 'filmeId' argument.");
      _filmeFuture = Future.value(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.728,
              child: Stack(
                children: [
                  Expanded(
                    child: FutureBuilder<Filme?>(
                      future: _filmeFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              "Erro ao carregar detalhes: ${snapshot.error}",
                            ),
                          );
                        } else if (snapshot.hasData && snapshot.data != null) {
                          final Filme filme = snapshot.data!;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://image.tmdb.org/t/p/w500${filme.posterPath}',
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                            child: Text(
                              "Nenhum detalhe encontrado para este filme.",
                            ),
                          );
                        }
                      },
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    child: Material(
                      elevation: 10,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        child: FutureBuilder<Filme?>(
                          future: _filmeFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  "Erro ao carregar detalhes: ${snapshot.error}",
                                ),
                              );
                            } else if (snapshot.hasData &&
                                snapshot.data != null) {
                              final Filme filme = snapshot.data!;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      filme.title,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineLarge?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 32,
                                      ),
                                    ),
                                    Text(
                                      filme.releaseDate.toString(),
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineLarge?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                            return Text("Falha ao carregar os dados");
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AppBar(
                      toolbarHeight: 35,
                      title: const Text("Não era o que queria?"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      elevation: 10,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              elevation: 20,
              child: Container(
                width: 375,
                decoration: BoxDecoration(
                  color: AppColors.primary700,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sinopse",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      FutureBuilder<Filme?>(
                        future: _filmeFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                "Erro ao carregar detalhes: ${snapshot.error}",
                              ),
                            );
                          } else if (snapshot.hasData &&
                              snapshot.data != null) {
                            final Filme filme = snapshot.data!;
                            final List<String> genreNames = filme.genres.map((genre) => genre.name).toList();
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    filme.overview.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  SizedBox(height: 24),
                                  Text("Gêneros:", style: Theme.of(context).textTheme.headlineMedium,),
                                  SizedBox(height: 12,),
                                  Text(genreNames.join(', '), style: Theme.of(context).textTheme.bodyLarge),
                                ],
                              ),
                            );
                          }
                          return Text("Falha ao carregar os dados");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
