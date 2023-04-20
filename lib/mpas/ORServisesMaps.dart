// ignore_for_file: file_names, prefer_typing_uninitialized_variables, avoid_print, unused_element, prefer_collection_literals, prefer_final_fields, prefer_const_constructors
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../Authentification/Auth_chauffeur/panne.dart';
import 'maps/my_drawer.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class ORServises extends StatefulWidget {
  const ORServises({Key? key}) : super(key: key);

  @override
  _ORServisesState createState() => _ORServisesState();
}

class _ORServisesState extends State<ORServises> {
  late GoogleMapController mapController;

  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newGoogleMapController;

  final List<LatLng> polyPoints = [];
  final List<LatLng> polyPoints1 = []; // For holding Co-ordinates as LatLng
  final List<LatLng> polyPoints2 = [];
  // For holding Co-ordinates as LatLng
  final Set<Polyline> polyLines = {};
  final Set<Polyline> polyLines1 = {}; // For holding instance of Polyline
  final Set<Polyline> polyLines2 = {}; // For holding instance of Polyline

  var data, data1, data2;

  final Set<Marker> markers = {}; // For holding instance of Marker
  //! firestore marker bin/
  var marker = <Marker>[];
  Set<Marker> _markers = {};
  late BitmapDescriptor pinLocationIcon;

  late BitmapDescriptor customIcon;

// make sure to initialize before map loading
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;

    //!lessthan 40 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    final Uint8List markerIcon =
        await getBytesFromAsset('images/vide.png', 110);
    await FirebaseFirestore.instance
        .collection("data")
        .where("pourcentage", isLessThanOrEqualTo: 60)
        .snapshots()
        .listen((event) {
      //_markers={};
      setState(() {
        bottomPaddingOfMap = 240;
        for (var doc in event.docs) {
          _markers.add(
            Marker(
                markerId: MarkerId(doc.id),
                position:
                    LatLng(doc.data()["Latitude"], doc.data()["Longitude"]),
                infoWindow: InfoWindow(
                  title:
                      " Id : ${doc.data()["name"]} \n Etat : ${doc.data()["etat"]}",
                  snippet: "pourcentage : ${doc.data()["pourcentage"]} ",
                ),
                icon: BitmapDescriptor.fromBytes(markerIcon)),
          );
        }
      });
    });

    ///!lessthan 60 & greate than 40 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    // BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(0.1, 0.1)),
    //         'images/icone-de-broche-de-localisation-verte.png')
    //     .then((d) {
    //   customIcon = d;
    // });

    final Uint8List markerIcon1 =
        await getBytesFromAsset('images/full.png', 110);

    _controllerGoogleMap.complete(controller);
    newGoogleMapController = controller;
    await FirebaseFirestore.instance
        .collection("data")
        .where("pourcentage", isGreaterThan: 60)
        .snapshots()
        .listen((event) async {
      //_markers={};
      setState(() {
        bottomPaddingOfMap = 240;

        for (var doc in event.docs) {
          _markers.add(
            Marker(
                markerId: MarkerId(doc.id),
                position:
                    LatLng(doc.data()["Latitude"], doc.data()["Longitude"]),
                infoWindow: InfoWindow(
                  title:
                      " Id : ${doc.data()["name"]} \n Etat : ${doc.data()["etat"]}",
                  snippet: "pourcentage : ${doc.data()["pourcentage"]} ",
                ),
                icon: BitmapDescriptor.fromBytes(markerIcon1)),
          );
        }
      });

//kol api les specification mte3ha feha url , rerquest , reponce w faha l methode http eli bch t5dem baha
//2 n5dmou bihom bch njeneriou des api key kelon specification
      ///pour la communication nest3lou f des requette http men open route
      ///
      ///google maps nest3mlou l sdk de google maps)*

      //http request rest plusieur methode f direction
      //neb3thoulha source de donner
      ///nconvertiou comme le format definit par open rourt
      //en consomme l('api) de open route
      //en lace le requette de lopen route
      //en oubtien des resultat en tratuite la reponce ala google maps google maps
      String url =
          'https://api.openrouteservice.org/v2/directions/driving-car/geojson';
      String apiKey =
          '5b3ce3597851110001cf62488a373729f5fe478ea1289b683c304eaa';
      String journeyMode =
          'driving-car'; // Change it if you want or make it variable
      List<List<double>> points = <List<double>>[];
      var docs = event.docs;
      for (var element in docs) {
        points.add([element.get("Longitude"), element.get("Latitude")]);
        // print(element.get("name"));
        // print(element.get("Longitude"));
        // print(element.get("Latitude"));
      }
      print("***------------------******");
      var body = json.encode({
        "coordinates": points,
        "radiuses": [10000]
      });
      Response response = await http.post(Uri.parse('$url'),
          body: body,
          headers: {
            "Content-Type": "application/json",
            "authorization": apiKey
          });
      setState(() {
        if (response.statusCode == 200) {
          String datastr = response.body;
          var data = jsonDecode(datastr);
          LineString ls =
              LineString(data['features'][0]['geometry']['coordinates']);

          for (int i = 0; i < ls.lineString.length; i++) {
            polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
          }
          if (polyPoints.length == ls.lineString.length) {
            Polyline polyline = Polyline(
              polylineId: PolylineId("polyline"),
              color: Color.fromARGB(255, 0, 89, 33),
              points: polyPoints,
            );
            polyLines.add(polyline);
          }
        } else {
          print(response.statusCode);
        }
      });
    });
    setState(() {});
    locateUserPosition();
  }
  //! firestore marker bin/

  final Set<Marker> _marker = Set<Marker>();
  GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();
//////!
  double searchLocationContainerHeight = 220;

  Position? userCurrentPosition;
  var geoLocator = Geolocator();

  LocationPermission? _locationPermission;
  double bottomPaddingOfMap = 0;

  checkIfLocationPermissionAllowed() async {
    _locationPermission = await geolocator.Geolocator.requestPermission();

    if (_locationPermission == geolocator.LocationPermission.denied) {
      _locationPermission = await geolocator.Geolocator.requestPermission();
    }
  }

  locateUserPosition() async {
    geolocator.Position cPosition =
        await geolocator.Geolocator.getCurrentPosition(
            desiredAccuracy: geolocator.LocationAccuracy.high);
    userCurrentPosition = cPosition;

    LatLng latLngPosition =
        LatLng(userCurrentPosition!.latitude, userCurrentPosition!.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 14);

    newGoogleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

//! current location
  late PolylinePoints polylinePoints;

  late StreamSubscription<LocationData> subscription;

  LocationData? currentLocation;
  late LocationData destinationLocation;
  late LocationData destination;

  late Location location;
  Completer<GoogleMapController> _controller = Completer();

  void updatePinsOnMap() async {
    CameraPosition cameraPosition = CameraPosition(
      zoom: 20,
      tilt: 80,
      bearing: 30,
      target: LatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
    );

    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    var sourcePosition = LatLng(
        currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

    setState(() {
      _marker.removeWhere((marker) => marker.mapsId.value == 'sourcePosition');

      _marker.add(Marker(
        markerId: const MarkerId('sourcePosition'),
        position: sourcePosition,
      ));
    });
  }

  @override
  void initState() {
    setState(() {});
    checkIfLocationPermissionAllowed();
    super.initState();
    location = Location();
    polylinePoints = PolylinePoints();

    subscription = location.onLocationChanged.listen((clocation) {
      currentLocation = clocation;

      updatePinsOnMap();
    });
    // getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: sKey,
      drawer: Container(
        width: 265,
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
          ),
          child: MyDrawer(),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
            onMapCreated: _onMapCreated,
            markers: _markers,
            mapType: MapType.normal,
            myLocationEnabled: true,
            // zoomGesturesEnabled: true,
            // zoomControlsEnabled: true,
            initialCameraPosition: const CameraPosition(
              target: LatLng(35.506798, 11.046753),
              zoom: 200,
            ),
            polylines: polyLines,
          ),

          //custom hamburger button for drawer
          Positioned(
            top: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                sKey.currentState!.openDrawer();
              },
              child: const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.menu,
                  color: Color.fromARGB(136, 0, 0, 0),
                ),
              ),
            ),
          ),

          //ui for searching location
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedSize(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 120),
              child: Container(
                height: 120,
                decoration: const BoxDecoration(
                  color: ui.Color.fromARGB(221, 81, 81, 81),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  child: Row(
                    children: [
                      ElevatedButton(
                        child: const Text(
                          " Actualiser ",
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ORServises()));
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            primary: Colors.green,
                            textStyle: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w900)),
                      ),
                      Spacer(),
                      ElevatedButton(
                        child: const Text(
                          "  Pannes  ",
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => panne()));
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            primary: Colors.lightBlue,
                            textStyle: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w900)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Create a new class to hold the Co-ordinates we've received from the response data

class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}
