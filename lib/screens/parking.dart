import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:user_location/user_location.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  color: Colors.grey[50], //remove color to make it transpatent
                  ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Need A Parking Spot?",
                            style: GoogleFonts.poppins(fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left:20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_pin),
                                SizedBox(width: 5,),
                              Text(
                                "Nearby Locations :",
                                style: GoogleFonts.poppins(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                       

                        












                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
