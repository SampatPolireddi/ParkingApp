import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:parking_app/screens/popularLocations.dart';
import 'package:parking_app/screens/popularLocations1.dart';
import 'package:parking_app/screens/searchbar.dart';
import 'package:user_location/user_location.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class Parking extends StatefulWidget {
  @override
  _ParkingState createState() => _ParkingState();
}

class _ParkingState extends State<Parking> {
  //To navigate to search bar page when search bar is pressed
  Future navigateToSearchBar(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SearchBar()));
  }

  //To navigate to popular locations page when a forum mall is pressed
  Future navigateToPopularLocations1(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PopularLocations1()));
  }

  //To navigate to popular locations page when a gvk mall is pressed
  Future navigateToPopularLocations(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PopularLocations()));
  }

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
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                //Search bar
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      HapticFeedback.selectionClick();
                                      navigateToSearchBar(context);
                                    },
                                    child: Text(
                                      "Search Destination",
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ),
                                ),
                              ),
                              Icon(Icons.search),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Popular Locations :",
                                style: GoogleFonts.poppins(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: GestureDetector(
                            onTap: () {
                              HapticFeedback.selectionClick();
                              navigateToPopularLocations1(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.location_pin,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Formum Mall",
                                  style: GoogleFonts.poppins(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 200,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: GestureDetector(
                            onTap: () {
                              HapticFeedback.selectionClick();
                              navigateToPopularLocations(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.location_pin,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "GVK One Mall",
                                  style: GoogleFonts.poppins(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 200,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        )
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
