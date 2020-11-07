import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:parking_app/screens/loginPage.dart';

class Parking extends StatefulWidget {
  @override
  _ParkingState createState() => _ParkingState();
}

class _ParkingState extends State<Parking> {
  MapController controller = new MapController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FlutterMap(
            mapController: controller,
            options: new MapOptions(
              
              minZoom: 13.0,
              maxZoom: 100,
            ),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
            ],
          ),
        ],
      ),
    );
  }
}
