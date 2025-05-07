import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cine_findr/model/Filme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Filme>> futurePlayingFilms;
  late Future<List<Filme>> futurePopularFilms;

  Future<List<Filme>> getPlayingFilms() async {
    final response = await http.get(Uri.parse('http://localhost:3000/movies?isNowPlaying=true'));

    if (response.statusCode == 200) {
      final List body = json.decode(response.body);
      return body.map((e) => Filme.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Filme>> getPopularFilms() async {
    final response = await http.get(Uri.parse('http://localhost:3000/movies?isPopular=true'));

    if (response.statusCode == 200) {
      final List body = json.decode(response.body);
      return body.map((e) => Filme.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futurePlayingFilms = getPlayingFilms();
    futurePopularFilms = getPopularFilms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.menu,
                size: 40,
                color: Theme.of(context).primaryColor,
              ),
            );
          },
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        title: Image.network('assets/img/logo.png', height: 60, width: 60),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {},
              child: Material(
                color: Colors.transparent,
                elevation: 20,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFD1D1D6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 71,
                  width: 255,
                  child: Text(
                    "Descobrir",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () {},
              child: Material(
                color: Colors.transparent,
                elevation: 20,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFD1D1D6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 71,
                  width: 255,
                  child: Text(
                    "Minha Lista",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () {},
              child: Material(
                color: Colors.transparent,
                elevation: 20,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFD1D1D6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 71,
                  width: 255,
                  child: Text(
                    "Configurações",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () {},
              child: Material(
                color: Colors.transparent,
                elevation: 20,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFD1D1D6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 71,
                  width: 255,
                  child: Text(
                    "Alterar Modo",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () {},
              child: Material(
                color: Colors.transparent,
                elevation: 20,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFD1D1D6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 71,
                  width: 255,
                  child: Text(
                    "Sair",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          Text("Descobrir", style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 3,
                  ),
                ),
                border: OutlineInputBorder(),

                label: Row(
                  children: [
                    Icon(Icons.search, color: Theme.of(context).primaryColor),

                    Text(
                      "Procurar",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 64),
          Container(
            color: Theme.of(context).primaryColor,
            width: MediaQuery.of(context).size.width,
            height: 180,
            child: Center(
              child: FutureBuilder<List<Filme>>(
                future: futurePlayingFilms,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<String?> posterPaths =
                        snapshot.data!
                            .map<String?>((filme) => filme.posterUrl)
                            .toList();

                    return CarouselSlider(
                      items:
                          posterPaths.map((posterPath) {
                            return Builder(
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/detalhes',
                                      arguments: {},
                                    );
                                  },
                                  child: Image.network(
                                    '$posterPath',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 120,
                                        width: 90,
                                        color: Colors.grey,
                                        child: Center(
                                          child: Text(
                                            "Sem Poster",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          }).toList(),
                      options: CarouselOptions(
                        height: 180,
                        viewportFraction: 0.2,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
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
          ),
          SizedBox(height: 24),
          Text("Populares", style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(height: 24),
          Expanded(
            child: FutureBuilder(
              future: futurePopularFilms,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Image.network(
                              snapshot.data![index].posterUrl,
                              height: 120,
                              width: 90,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 120,
                                  width: 90,
                                  color: Colors.grey,
                                  child: Center(
                                    child: Text(
                                      "Sem Poster",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 48),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].title,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      snapshot.data![index].overview,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("Erro");
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
