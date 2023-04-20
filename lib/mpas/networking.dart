// ignore_for_file: avoid_print, unnecessary_string_interpolations

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper();
  final String url =
      'https://api.openrouteservice.org/v2/directions/driving-car/geojson';
  final String apiKey =
      '5b3ce3597851110001cf62488a373729f5fe478ea1289b683c304eaa';
  final String journeyMode =
      'driving-car'; // Change it if you want or make it variable
  Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
    return FirebaseFirestore.instance
        .collection("data")
        .where("pourcentage", isGreaterThan: 60)
        .snapshots();
  }
}
