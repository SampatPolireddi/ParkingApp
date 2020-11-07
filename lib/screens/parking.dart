import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong/latlong.dart';
import 'package:user_location/user_location.dart';


class Parking extends StatefulWidget {
  @override
  _ParkingState createState() => _ParkingState();
}

class _ParkingState extends State<Parking> {
   // ADD THIS
  MapController mapController = MapController();
  UserLocationOptions userLocationOptions;
  // ADD THIS
  List<Marker> markers = [];
  @override
  Widget build(BuildContext context) {
    // You can use the userLocationOptions object to change the properties
    // of UserLocationOptions in runtime
    userLocationOptions = UserLocationOptions(
                context: context,
                mapController: mapController,
                markers: markers,
                );
    return Scaffold(
        appBar: AppBar(title: Text("User Location Plugin")),
        body: FlutterMap(
          options: MapOptions(
            center: LatLng(0,0),
            zoom: 15.0,
            plugins: [
             // ADD THIS
              UserLocationPlugin(),
            ],
          ),
          layers: [
           new TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
            // ADD THIS
            MarkerLayerOptions(markers: markers),
            // ADD THIS
            userLocationOptions,
          ],
          // ADD THIS
          mapController: mapController,
        ));
  }
}