// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/Views/visitor/New_navBar.dart';
// import 'package:flutter_application_2/Views/visitor/update_reservation.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// import '../park_owner/form_addPark.dart';
// import '../park_owner/park.dart';
// import '../park_owner/update_park.dart';
// import 'database_reservation.dart';

// class ConsultReservation extends StatefulWidget {
//   const ConsultReservation({Key? key}) : super(key: key);

//   @override
//   State<ConsultReservation> createState() => _ConsultReservationState();
// }

// class _ConsultReservationState extends State<ConsultReservation> {
//   late DatabaseReservation db;
//   List docs = [];
//   initialise() {
//     db = DatabaseReservation();
//     db.initiliase();
//     db.read().then(
//           (value) => {
//             setState(() {
//               docs = value;
//             })
//           },
//         );
//   }

//   @override
//   void initState() {
//     super.initState();
//     initialise();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: RefreshIndicator(
//       onRefresh: () async {
//         //Navigator.push(context,MaterialPageRoute(builder:(context)=> ConsultPark()));
//         //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ConsultReservation()));
//       },
//       child: ListView.separated(
//         itemCount: docs.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Slidable(
//             key: ValueKey(index),
//             startActionPane: ActionPane(
//               //dismissible: DismissiblePane(onDismissed: (){},),
//               motion: ScrollMotion(),
//               children: [
//                 SlidableAction(
//                   onPressed: (BuildContext context) {
//                     print(docs[index]["id"]);
//                     Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => UpdateReservation(
//                                 name: docs[index]["name"],
//                                 id: docs[index]["id"],
//                                 plateNumber: docs[index]["plate_number"],
//                                 phoneNumber: docs[index]["phone_number"])));
//                   },
//                   backgroundColor: Colors.greenAccent,
//                   foregroundColor: Colors.white,
//                   icon: Icons.update_outlined,
//                   label: 'Update',
//                 ),
//               ],
//             ),
//             endActionPane: ActionPane(
//               //dismissible: DismissiblePane(onDismissed: (){},),
//               motion: ScrollMotion(),
//               children: [
//                 SlidableAction(
//                   onPressed: (BuildContext context) {
//                     //print(docs[index]["id"]);
//                     FirebaseFirestore.instance
//                         .collection("reservation")
//                         .doc(docs[index]["id"])
//                         .delete();
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => HomePageVisitor()));
//                   },
//                   backgroundColor: Colors.deepOrange,
//                   foregroundColor: Colors.white,
//                   icon: Icons.delete,
//                   label: 'Delete',
//                 ),
//               ],
//             ),
//             child: ListTile(
//               tileColor: Colors.grey.shade200,
//               title: Text(
//                 " Name:  ${docs[index]['name']} \n Phone number:  ${docs[index]["phone_number"]} \n Plate number:  ${docs[index]["plate_number"]} \n Start time:  ${docs[index]["start_time"]} \n Finish time :  ${docs[index]["finish_time"]}",
//                 style: TextStyle(fontSize: 22),
//               ),
//               minVerticalPadding: 20,

//               //trailing: Text("Adresse: "+docs[index]['adresse'] ,  style: TextStyle(fontSize: 20)),
//             ),
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) => Container(
//           height: 10,
//         ),
//       ),
//     ));
//   }
// }
