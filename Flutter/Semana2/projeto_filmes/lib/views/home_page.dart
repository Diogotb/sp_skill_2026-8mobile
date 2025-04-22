import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:projeto_filmes/controller/filme_controller.dart';
import 'package:projeto_filmes/model/filme.dart';
import 'package:projeto_filmes/widgets/curved_container.dart';

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
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, '/search');
          }, icon: Icon(Icons.search, color: Colors.white,))
        ],
        centerTitle: true,
        title: Text("Absolute Cinema", style: TextStyle(color: Colors.white70)),
        backgroundColor: Color(0xFF6B0000),
      ),
      body: Center(
        child: Column(
          children: [
            CurvedContainer(
              curveHeight: 75,
              color: Colors.white70,
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Text(
                    "Populares Agora!",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),

                  SizedBox(height: 24),
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
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.3,
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
                            viewportFraction: 0.3,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(
                              milliseconds: 800,
                            ),
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
          ],
        ),
      ),
    );
  }
}
