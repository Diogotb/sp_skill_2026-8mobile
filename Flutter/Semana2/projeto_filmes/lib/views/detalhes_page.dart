import 'package:flutter/material.dart';
import 'package:projeto_filmes/controller/filme_controller.dart';
import 'package:projeto_filmes/model/filme.dart';

class DetalhesPage extends StatefulWidget {
  DetalhesPage({super.key});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    FilmeController _filmeController = FilmeController();
    int? _filmeId;
    Future<Filme>? _filmeFuture;

    @override
    void initState() {
      super.initState();
      _filmeId = ModalRoute.of(context)?.settings.arguments as int?;
      if(_filmeId != null){
        _filmeFuture  = _filmeController.getFilmById(_filmeId!);
      }
    }

    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(future: _filmeFuture, builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            } else if (snapshot.hasError){
              return Center(child: Text("Erro ao carregar detalhes!"),);
            } else if(snapshot.hasData){
              Filme filme = snapshot.data!;
              return Text("Título:" + filme.title);
            }
            return const Text("Nenhum dado encontrado");
          })
        ],
      ),
    );
  }


}
