import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:user_location/user_location.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

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
        body: Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height - 300.0,
          width: MediaQuery.of(context).size.width,
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(0, 0),
              zoom: 17.0,
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
          ),
        ),
        Expanded(
          child: Container(
            
              decoration: BoxDecoration(
                  color: Colors.blue[50], //remove color to make it transpatent
                  border: Border.all(
                      style: BorderStyle.solid, color: Colors.white)),
              child: Row(
                

              ),
              ),
              ),
      ],
        ),
      );
  }
}
