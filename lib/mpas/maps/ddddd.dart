// // ignore_for_file: file_names, prefer_typing_uninitialized_variables, avoid_print, unused_element, prefer_collection_literals, prefer_final_fields, prefer_const_constructors

// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../networking.dart';
// import 'package:location/location.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';

// class MyORSmapss extends StatefulWidget {
//   const MyORSmapss({Key? key}) : super(key: key);

//   @override
//   _MyORSmapssState createState() => _MyORSmapssState();
// }

// class _MyORSmapssState extends State<MyORSmapss> {
//   late GoogleMapController mapController;

//   final List<LatLng> polyPoints = []; // For holding Co-ordinates as LatLng
//   final List<LatLng> polyPoints2 = []; // For holding Co-ordinates as LatLng
//   final Set<Polyline> polyLines = {}; // For holding instance of Polyline
//   final Set<Polyline> polyLines2 = {}; // For holding instance of Polyline
//   final Set<Marker> markers = {}; // For holding instance of Marker
//   var data, data2;
//   final Set<Marker> _marker = Set<Marker>();

//   ////! markers
//   Set<Marker> _markers = {};
//   List<LatLng> Markerbin = [];
//   ////! markers

//   // Dummy Start and Destination Points
//   List<List<double>> points = [
//     [10.551657436615397, 36.530402000804266],
//     [10.554948879825927, 36.56818034155527],
//     [10.501735050018024, 36.60197780923166]
//   ];

//   List<List<double>> points2 = [
//     [10.501735050018024, 36.60197780923166],
//     [10.446553796973557, 36.66873948038506]
//   ];
//   double startLat = 36.530402000804266;
//   double startLng = 10.551657436615397;
//   //!marker2
//   double lat = 36.56818034155527;
//   double log = 10.554948879825927;
//   //!marker2

//   double endLat = 36.60197780923166;
//   double endLng = 10.501735050018024;
//   LatLng sourceLocation = const LatLng(35.5369, 11.0274);
//   LatLng destinationLatlng = const LatLng(35.5241, 11.0308);
//   LatLng destinationtwo = const LatLng(35.5047, 11.0622);
// //! current location
//   late PolylinePoints polylinePoints;

//   late StreamSubscription<LocationData> subscription;

//   LocationData? currentLocation;
//   late LocationData destinationLocation;
//   late LocationData destination;

//   late Location location;
//   Completer<GoogleMapController> _controller = Completer();

//   void setInitialLocation() async {
//     await location.getLocation().then((value) {
//       currentLocation = value;
//       setState(() {});
//     });

//     destinationLocation = LocationData.fromMap({
//       "latitude": destinationLatlng.latitude,
//       "longitude": destinationLatlng.longitude,
//     });
//     destination = LocationData.fromMap({
//       "latitude": destinationtwo.latitude,
//       "longitude": destinationtwo.longitude,
//     });
//   }

//   void updatePinsOnMap() async {
//     CameraPosition cameraPosition = CameraPosition(
//       zoom: 20,
//       tilt: 80,
//       bearing: 30,
//       target: LatLng(
//           currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
//     );

//     final GoogleMapController controller = await _controller.future;

//     controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

//     var sourcePosition = LatLng(
//         currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

//     setState(() {
//       _marker.removeWhere((marker) => marker.mapsId.value == 'sourcePosition');

//       _marker.add(Marker(
//         markerId: const MarkerId('sourcePosition'),
//         position: sourcePosition,
//       ));
//     });
//   }

// //! firestore marker bin
//   void _onMapCreated(GoogleMapController controller) async {
//     mapController = controller;
//     await FirebaseFirestore.instance
//         .collection("data")
//         .snapshots()
//         .listen((event) {
//       //_markers={};
//       setState(() {
//         for (var doc in event.docs) {
//           _markers.add(
//             Marker(
//                 markerId: MarkerId(doc.id),
//                 position:
//                     LatLng(doc.data()["Latitude"], doc.data()["Longitude"]),
//                 infoWindow: InfoWindow(
//                   title: doc.data()["name"],
//                   snippet: "pourcentage : ${doc.data()["pourcentage"]}",
//                 ),
//                 icon: BitmapDescriptor.defaultMarkerWithHue(
//                     BitmapDescriptor.hueAzure)),
//           );
//         }
//       });
//     });
//   }

//   void getJsonData() async {
//     // Create an instance of Class NetworkHelper which uses http package
//     // for requesting data to the server and receiving response as JSON format

//     NetworkHelper network = NetworkHelper();
//     NetworkHelper network2 = NetworkHelper();

//     try {
//       // getData() returns a json Decoded data
//       data = await network.getData();
//       data2 = await network2.getData();
//       // print(data);
//       // We can reach to our desired JSON data manually as following
//       LineString ls =
//           LineString(data['features'][0]['geometry']['coordinates']);

//       for (int i = 0; i < ls.lineString.length; i++) {
//         polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
//       }
//       if (polyPoints.length == ls.lineString.length) {
//         setPolyLines();
//       }

//       // if (polyPoints2.length == ls2.lineString.length) {
//       //   setPolyLines2();
//       // }
//     } catch (e) {
//       print(e);
//     }
//   }

//   setPolyLines() {
//     Polyline polyline = Polyline(
//       polylineId: const PolylineId("polyline"),
//       color: Color.fromARGB(255, 0, 94, 34),
//       points: polyPoints,
//     );
//     polyLines.add(polyline);
//     Polyline polyline2 = Polyline(
//       polylineId: const PolylineId("polyline2"),
//       color: Color.fromARGB(255, 94, 0, 0),
//       points: polyPoints2,
//     );
//     polyLines.add(polyline2);

//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     location = Location();
//     polylinePoints = PolylinePoints();

//     subscription = location.onLocationChanged.listen((clocation) {
//       currentLocation = clocation;

//       updatePinsOnMap();
//     });

//     setInitialLocation();
//     getJsonData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Polyline Demo'),
//           backgroundColor: Colors.green[700],
//         ),
//         body: GoogleMap(
//           onMapCreated: _onMapCreated,
//           markers: _markers,
//           initialCameraPosition: const CameraPosition(
//             target: LatLng(36.56818034155527, 10.554948879825927),
//             zoom: 15,
//           ),
//           polylines: polyLines,
//         ),
//       ),
//     );
//   }
// }

// //Create a new class to hold the Co-ordinates we've received from the response data

// class LineString {
//   LineString(this.lineString);
//   List<dynamic> lineString;
// }
