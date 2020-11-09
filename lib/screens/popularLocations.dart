import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/services.dart';

class PopularLocations extends StatefulWidget {
  @override
  _PopularLocationsState createState() => _PopularLocationsState();
}

class _PopularLocationsState extends State<PopularLocations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            height: MediaQuery.of(context).size.height - 400.0,
            width: MediaQuery.of(context).size.width,
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(17.4193, 78.4485),
                zoom: 17.0,
              ),
              layers: [
                new TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                MarkerLayerOptions(markers: [
                  Marker(
                      width: 45.0,
                      height: 45.0,
                      point: new LatLng(17.4193, 78.4485),
                      builder: (context) => new Container(
                            child: Icon(
                              Icons.location_pin,
                              size: 40,
                            ),
                          ))
                ]),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("GVK Parking",
                        style: GoogleFonts.poppins(
                            fontSize: 32, fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Banjara Hills, Hyderabad",
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.directions_car,
                      size: 20,
                      color: Colors.grey[700],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "500",
                      style: GoogleFonts.poppins(fontSize: 18),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.monetization_on_rounded,
                      color: Colors.grey[700],
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("10.0/h", style: GoogleFonts.poppins(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height - 600,
                          width: MediaQuery.of(context).size.width - 150,
                          margin: const EdgeInsets.only(
                              bottom: 6.0), //Same as `blurRadius` i guess
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[300],
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "5 hrs",
                                style: GoogleFonts.poppins(fontSize: 30),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Max Time",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        HapticFeedback.selectionClick();
                      },
                      color: Colors.black,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Continue",
                          style: GoogleFonts.poppins(
                              fontSize: 18, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
