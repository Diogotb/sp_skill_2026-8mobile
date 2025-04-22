import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:projeto_filmes/controller/filme_controller.dart';
import 'package:projeto_filmes/model/filme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Filme>> futureFilmes;
  FilmeController filmeController = FilmeController();

  @override
  void initState() {
    super.initState();
    futureFilmes = filmeController.getFilmes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Absolute Cinema"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            FutureBuilder<List<Filme>>(
              future: futureFilmes,
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
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500$posterPath',
                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                          );
                        }).toList(),
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.2,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
