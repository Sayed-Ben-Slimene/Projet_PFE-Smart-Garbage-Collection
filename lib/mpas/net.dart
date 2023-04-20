// ignore_for_file: file_names, prefer_typing_uninitialized_variables, avoid_print, unused_element, prefer_collection_literals, prefer_final_fields, prefer_const_constructors
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'maps/my_drawer.dart';
import 'networking.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class ORSServises extends StatefulWidget {
  const ORSServises({Key? key}) : super(key: key);

  @override
  _ORSServisesState createState() => _ORSServisesState();
}

class _ORSServisesState extends State<ORSServises> {
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

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    setMarkers();
//!

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
                  title: doc.data()["name"],
                  snippet: "pourcentage : ${doc.data()["pourcentage"]}",
                ),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen)),
          );
        }
      });
    });

//!

    _controllerGoogleMap.complete(controller);
    newGoogleMapController = controller;
    await FirebaseFirestore.instance
        .collection("data")
        .where("pourcentage", isGreaterThan: 60)
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
                  title: doc.data()["name"],
                  snippet: "pourcentage : ${doc.data()["pourcentage"]}",
                ),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed)),
          );
        }
      });
    });
    NetworkHelper network = NetworkHelper();
    network.getData().listen((event) async {
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
            setPolyLines();
          }
        } else {
          print(response.statusCode);
        }
      });
    });
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

  //////!
  List<List<double>> points1 = [
    [11.067671312269548, 35.50375296168674],
    [11.031234665558134, 35.52393549150598],
    [11.031561997427834, 35.52303438831082],
    [11.031756090523913, 35.522567368788536],
    [11.032348917937044, 35.521132036250535],
    [11.032951708067381, 35.5196561320726],
    [11.034351575618137, 35.51938040473992],
    [11.035681700194255, 35.51930336669379],
    [11.039208768283398, 35.51900329056132],
    [11.04273584374618, 35.51777875324212],
    [11.04514700572491, 35.51608382537435],
    [11.047627917927125, 35.513464317118505],
    [11.051857422350068, 35.51153003995425],
    [11.053017026556347, 35.51080013798649],
    [11.056444093375596, 35.50886762735466],
    [11.061441874501444, 35.50670262995529],
    [11.067546370431485, 35.50494449232602],
  ];
  // Dummy Start and Destination Points
  List<List<double>> points = [
    [11.067671312269548, 35.50375296168674],
    [11.031234665558134, 35.52393549150598],
    [11.031561997427834, 35.52303438831082],
    [11.031756090523913, 35.522567368788536],
    [11.032348917937044, 35.521132036250535],
    [11.032951708067381, 35.5196561320726],
    [11.034351575618137, 35.51938040473992],
    [11.035681700194255, 35.51930336669379],
    [11.039208768283398, 35.51900329056132],
    [11.04273584374618, 35.51777875324212],
    [11.04514700572491, 35.51608382537435],
    [11.047627917927125, 35.513464317118505],
    [11.051857422350068, 35.51153003995425],
    [11.053017026556347, 35.51080013798649],
    [11.056444093375596, 35.50886762735466],
    [11.061441874501444, 35.50670262995529],
    [11.067546370431485, 35.50494449232602]
  ];

  List<List<double>> points2 = [
    [10.501735050018024, 36.60197780923166],
    [10.446553796973557, 36.66873948038506]
  ];
  double startLat = 36.530402000804266;
  double startLng = 10.551657436615397;
  //!marker2
  double lat = 36.56818034155527;
  double log = 10.554948879825927;
  //!marker2

  double endLat = 36.60197780923166;
  double endLng = 10.501735050018024;
  LatLng sourceLocation = const LatLng(35.5369, 11.0274);
  LatLng destinationLatlng = const LatLng(35.5241, 11.0308);
  LatLng destinationtwo = const LatLng(35.5047, 11.0622);
//! current location
  late PolylinePoints polylinePoints;

  late StreamSubscription<LocationData> subscription;

  LocationData? currentLocation;
  late LocationData destinationLocation;
  late LocationData destination;

  late Location location;
  Completer<GoogleMapController> _controller = Completer();

  void setInitialLocation() async {
    await location.getLocation().then((value) {
      currentLocation = value;
      setState(() {});
    });

    destinationLocation = LocationData.fromMap({
      "latitude": destinationLatlng.latitude,
      "longitude": destinationLatlng.longitude,
    });
    destination = LocationData.fromMap({
      "latitude": destinationtwo.latitude,
      "longitude": destinationtwo.longitude,
    });
  }

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

  setMarkers() {
    markers.add(
      Marker(
        markerId: const MarkerId("camion"),
        position: LatLng(startLat, startLng),
        infoWindow: const InfoWindow(
          title: "camion",
          snippet: "camion",
        ),
      ),
    );
    markers.add(
      Marker(
        markerId: const MarkerId("1"),
        position: LatLng(lat, log),
        infoWindow: const InfoWindow(
          title: "1",
          snippet: "1",
        ),
      ),
    );
    markers.add(Marker(
      markerId: const MarkerId("2"),
      position: LatLng(endLat, endLng),
      infoWindow: const InfoWindow(
        title: "2",
        snippet: "2",
      ),
    ));
    setState(() {});
  }

  void getJsonData() async {
    // Create an instance of Class NetworkHelper which uses http package
    // for requesting data to the server and receiving response as JSON format

    NetworkHelper network = NetworkHelper();
    // NetworkHelper network1 = NetworkHelper(points: points1);
    // NetworkHelper network2 = NetworkHelper(points: points2);

    try {
      // getData() returns a json Decoded data
      data = await network.getData();
      // data1 = await network1.getData();
      // data2 = await network2.getData();
      // print(data);
      // We can reach to our desired JSON data manually as following
      LineString ls =
          LineString(data['features'][0]['geometry']['coordinates']);

      for (int i = 0; i < ls.lineString.length; i++) {
        polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
      }
      if (polyPoints.length == ls.lineString.length) {
        setPolyLines();
      }

      // if (polyPoints2.length == ls2.lineString.length) {
      //   setPolyLines2();
      // }
    } catch (e) {
      print(e);
    }
  }

  setPolyLines() {
    var index = Random();
    var colors = [
      Color.fromARGB(255, 0, 94, 34),
      Color.fromARGB(255, 211, 0, 4),
      Color.fromARGB(255, 62, 0, 170),
      Color.fromARGB(255, 200, 0, 211),
      Color.fromARGB(255, 188, 194, 0)
    ];
    setState(() {});
    var ii = index.nextInt(5);
    Polyline polyline = Polyline(
      polylineId: PolylineId("polyline $ii"),
      color: colors[index.nextInt(5)],
      points: polyPoints,
    );
    polyLines.add(polyline);
    // Polyline polyline2 = Polyline(
    //   polylineId: const PolylineId("polyline2"),
    //   color: Color.fromARGB(255, 94, 0, 0),
    //   points: polyPoints2,
    // );
    // polyLines.add(polyline2);

    setState(() {});
  }

  @override
  void initState() {
    checkIfLocationPermissionAllowed();
    super.initState();
    location = Location();
    polylinePoints = PolylinePoints();

    subscription = location.onLocationChanged.listen((clocation) {
      currentLocation = clocation;

      updatePinsOnMap();
    });

    setInitialLocation();
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
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            initialCameraPosition: const CameraPosition(
              target: LatLng(36.56818034155527, 10.554948879825927),
              zoom: 15,
            ),
            polylines: polyLines,
          ),

          //custom hamburger button for drawer
          Positioned(
            top: 30,
            left: 14,
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
                height: searchLocationContainerHeight,
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  child: Column(
                    children: [
                      //from
                      Row(
                        children: [
                          const Icon(
                            Icons.add_location_alt_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "From",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              Text(
                                "your current location",
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 10.0),

                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),

                      const SizedBox(height: 16.0),

                      //to
                      Row(
                        children: [
                          const Icon(
                            Icons.add_location_alt_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "To",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              Text(
                                "Where to go?",
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 10.0),

                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),

                      const SizedBox(height: 16.0),

                      ElevatedButton(
                        child: const Text(
                          "Refrech",
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ORSServises()));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
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
