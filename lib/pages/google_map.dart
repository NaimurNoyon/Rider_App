import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/colors.dart';

class MapPage extends StatelessWidget {
  static const String routeName='/mappage';

  static const initialcamerapossition  = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF565d91),
        title: const Text('Navigation',
          style: TextStyle(fontSize: 20),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0.0,0.0,10.0,0.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 0, 8),
              child: Row(
                children: [
                  Expanded(
                      child: Text('Are You Facing Any Trouble?', style: TextStyle(color: themeColorBlue),)
                  ),
                  Expanded(
                      child: TextButton(
                        child: Text('CLICK HERE',style: TextStyle(color: themeColorBlue, decoration: TextDecoration.underline,),),
                        onPressed: (){},
                      ))
                ],
              ),
            ),
            SizedBox(height: 5,),
            Container(
              height: 650,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: initialcamerapossition,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                  ),
                ],
              ) ,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      width: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: firstbuttoncolor,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(8), // <-- Radius
                          ),
                        ),
                        onPressed: (){

                        },
                        child: Text('CALL ME',style: TextStyle(fontSize: 17),),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      width: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: themeColorBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(8), // <-- Radius
                          ),
                        ),
                        onPressed: (){

                        },
                        child: Text('DELIVERED',style: TextStyle(fontSize: 17),),
                      ),
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
