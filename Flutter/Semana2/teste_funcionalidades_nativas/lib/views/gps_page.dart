import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GpsPage extends StatefulWidget {
  const GpsPage({super.key});

  @override
  State<GpsPage> createState() => _GpsPageState();
}

class _GpsPageState extends State<GpsPage> {
  GoogleMapController? _mapController;
  LatLng? _posicaoAtual;
  String texto = "";
  Position? _posicao;

  @override
  void initState() {
    super.initState();
    _pegarPosicao();
  }

  Future<void> _pegarPosicao() async {
    LocationPermission permission;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Serviço desativado');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Permissão negada');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Permissão negada");
    }

    Position pos = await Geolocator.getCurrentPosition();

    setState(() {
      _posicaoAtual = LatLng(pos.latitude, pos.longitude);
    });

    _mapController?.animateCamera(CameraUpdate.newLatLng(_posicaoAtual!));
  }

  Future<Position> _pegarLatLng() async {
    LocationPermission permission;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Serviço desativado');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Permissão negada');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Permissão negada");
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gps")),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,

            child:
                _posicaoAtual == null
                    ? Center(child: CircularProgressIndicator())
                    : GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _posicaoAtual!,
                        zoom: 16,
                      ),
                      myLocationEnabled: false,
                      onMapCreated: (GoogleMapController controller) {
                        _mapController = controller;
                      },
                    ),
          ),
          ElevatedButton(
            onPressed: () async {
              Position futurePos = await _pegarLatLng();
              texto = 'latitude: ${futurePos.latitude}, Longitude: ${futurePos.longitude}';
            },
            child: Text("Pegar posição atual"),
          ),
          SizedBox(height: 24),
          Text(texto),
        ],
      ),
    );
  }
}
