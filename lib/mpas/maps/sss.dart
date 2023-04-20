/** import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Views/visitor/parking_details.dart';
//import 'package:flutter_application_2/Views/visitor/reservation.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) async {
    await FirebaseFirestore.instance
        .collection("parking")
        .snapshots()
        .listen((event) {
      //_markers={};
      setState(() {
        for (var doc in event.docs) {
          _markers.add(
            Marker(
                markerId: MarkerId(doc.id),
                position:
                    LatLng(doc.data()["latitude"], doc.data()["longtitude"]),
                onTap: () {
                  print(" maaaaa ${doc.data()['nbre_de_place']}");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Details(
                                id_park: doc.id,
                                name_park: doc.data()['name'],
                                tarif: doc.data()['tarif'],
                                nombre_place: doc.data()['nbre_de_place'],
                              )));
                },
                infoWindow: InfoWindow(
                  title: doc.data()["name"],
                  snippet: "Fees : ${doc.data()["tarif"]}",
                ),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueAzure)),
          );
        }
        //print("ahlaaaaaaaaaa ${_markers}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position?>(context);

    return Scaffold(
        body: (currentPosition != null)
            ? Column(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.13,
                      width: MediaQuery.of(context).size.width,
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        markers: _markers,
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(35.5, 11.0),
                          zoom: 9.0,
                        ),
                        zoomGesturesEnabled: true,
                      ),
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}*/
