import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:parking_app/screens/garage.dart';
import 'package:parking_app/screens/parking.dart';
import 'package:geolocator/geolocator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //To navigate to the page required by tapping specific buttons
  Future navigateToParking(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Parking()));
  }

  Future navigateToGarage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Garage()));
  }

  //to get user's location
  _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    return position;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          //image
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage("assets/images/img1.jpg"),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          //Title
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          //Para
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Container(
              child: Text(
                "Any time we start something new it is exciting and we are very motivated and committed.",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          //Login Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                //google signin
                SizedBox(
                  child: SignInButton(Buttons.GoogleDark,
                      onPressed: () => _onButtonPressed() //Sign in Button
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //Bottum pop us space

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            //NOTE: this is added as background color, so that the rounder corners are visible, if you remove this the rounded corners will not be vissible as background is same color
            color: Color(0xFF737373),
            height: 150,
            child: Container(
              child: _buildBottomNavigationMenu(),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
              ),
            ),
          );
        });
  }

  Column _buildBottomNavigationMenu() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: ListTile(
            leading: Icon(
              Icons.local_parking_rounded,
              color: Colors.blueAccent,
              size: 35,
            ),
            title: Text("Find Parking"),
            onTap: () {
              _getCurrentLocation();
              navigateToParking(context); //navigates to parking page
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: ListTile(
            leading: Icon(
              Icons.monetization_on_rounded,
              color: Colors.blueAccent,
              size: 35,
            ),
            title: Text("Rent Your Garage"),
            onTap: () {
              navigateToGarage(context); //navigates to garage page
            },
          ),
        ),
      ],
    );
  }
}
