// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:rassurant/screens/interadmin.dart';
// import 'package:rassurant/screens/signin_screen.dart';
// import '../utils/color_utils.dart';
// import 'package:country_code_picker/country_code_picker.dart';



// class updateusers extends StatefulWidget {
// //     updateusers({Key? key,
// //       required this.email,
// //       required this.location,
// //       required this.nom,
// //       required this.id,
// //       required this.password,
// //       required this.numero})
// //       : super(key: key);

// // String email;
// //   String location;
// //   String nom;
// //   String id;
// //   String password;
// //   String numero;

// // final _formKey = GlobalKey<FormState>();

// //   String? newemail;
// //   String? newlocation;
// //   String? newnom;
// //   String? newid;
// //   String? newpassword;
// //   String? newnumero;

//   @override
//   _updateusersState createState() =>_updateusersState();
// }



// class _updateusersState extends State<updateusers> {
//  final _auth = FirebaseAuth.instance;
   
//   bool _isSecret = true;
//   bool _isSecretCon = true;
//   // string for displaying the error Message
//   String? errorMessage;

//   // our form key
//   final _formKey = GlobalKey<FormState>();




//   @override
//   Widget build(BuildContext context) {


// //nom et prénom
//      final NameField = TextFormField(

//     initialValue: widget.nom,
//     onChanged: (newValue) => widget.newnom = newValue,
//     obscureText: false,

//     cursorColor: Colors.black,
//     validator: (value) {
//           RegExp regex = new RegExp(r'^.{3,}$');
//           if (value!.isEmpty) {
//             return ("veuillez entrer votre nom d'utilisateur");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("Entrez un nom valide (Min. 3 caractères)");
//           }
//           return null;
//         },

//         onSaved: (value) {
//          widget.newnom = value!;
//        },

//     style: TextStyle(color: Colors.black.withOpacity(0.9)),
//     decoration: InputDecoration(
//       prefixIcon: Icon(
//         Icons.person_outline,
//         color: Colors.black,
//       ),
//       labelText: "Nom et prénom",
//       labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
//       filled: true,
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       fillColor: Colors.purple.withOpacity(0.3),
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//           borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
//     ),



//   );

// //location field
//        final locationField = TextFormField(

//     initialValue: widget.location,
//     onChanged: (newValue) => widget.newlocation = newValue,
//     obscureText: false ,
//             validator: (value) {
//           RegExp regex = new RegExp(r'^.{3,}$');
//           if (value!.isEmpty) {
//             return ("veuillez entrer votre localisation");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("Entrez une localisation valide (Min. 3 caractères)");
//           }
//           return null;
//         },
//                 onSaved: (value) {
//          widget.newlocation = value!;
//        },
//     cursorColor: Colors.black,
//     style: TextStyle(color: Colors.black.withOpacity(0.9)),
//     decoration: InputDecoration(
//       prefixIcon: Icon(
//         Icons.location_on,
//         color: Colors.black,
//       ),
//       labelText: "Localisation",
//       labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
//       filled: true,
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       fillColor: Colors.purple.withOpacity(0.3),
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//           borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
//     ),
//   );



// //numéro de téléphone

// final NumField = TextFormField(

  
          
//     initialValue: widget.numero,
//     onChanged: (newValue) => widget.newnumero = newValue,
//     obscureText: false ,
//     keyboardType: TextInputType.phone,
//     validator: (value) {
//         RegExp regex = new RegExp(r'0123456789');
//         if (value!.isEmpty) {
//           return "veuillez entrer votre numéro de téléphone";
//         } else if (value.length < 😎 {
//           return "entrer un numéro de téléphone valide";
//         }
//         return null;
//       },
//       onSaved: (value) {
//         widget.newnumero = value!;
//       },
//     cursorColor: Colors.black,
//     style: TextStyle(color: Colors.black.withOpacity(0.9)),
//     decoration: InputDecoration(
//         prefixIcon: Padding(
//           child: CountryCodePicker(
//             flagWidth: 24,
//             showCountryOnly: true,
//             showOnlyCountryWhenClosed: false,
//             favorite: ['+216', 'TN'],
//             initialSelection: 'TN',
//             hideMainText: true,
//             showFlagMain: true,
//           ),
//           padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0.0),
//         ),
//       labelText: "Numéro de téléphone",
//       labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
//       filled: true,
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       fillColor: Colors.purple.withOpacity(0.3),
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//           borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
//     ),
//   );


//     //email field

//     final emailField = TextFormField(
  
//    initialValue: widget.email,
//     onChanged: (newValue) => widget.newemail = newValue,
//     obscureText: false,

//     cursorColor: Colors.black,
//     validator: (value) {
//           if (value!.isEmpty) {
//             return ("veuillez entrer votre email");
//           }
//           // reg expression for email validation
//           if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//               .hasMatch(value)) {
//             return ("Veuillez entrer un email valide");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           widget.newemail = value!;
//         }, 
//     style: TextStyle(color: Colors.black.withOpacity(0.9)),
//     decoration: InputDecoration(
//       prefixIcon: Icon(
//         Icons.mail,
//         color: Colors.black,
//       ),
//       labelText: "Email",
//       labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
//       filled: true,
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       fillColor: Colors.purple.withOpacity(0.3),
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//           borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
//     )
//     );

    
    
    
    

//     //password field
//     final passwordField = TextFormField(

//     initialValue: widget.password,
//     onChanged: (newValue) => widget.newpassword = newValue,
//     obscureText: _isSecret,    
//     validator: (value) {
//           RegExp regex = new RegExp(r'^.{6,}$');
//           if (value!.isEmpty) {
//             return ("Le mot de passe est requis pour la connexion");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("Entrez un mot de passe valide (min. 6 caractères)");
//           }
//         },
//         onSaved: (value) {
//           widget.newpassword = value!;
//         },
//     cursorColor: Colors.black,
//     style: TextStyle(color: Colors.black.withOpacity(0.9)),
//     decoration: InputDecoration(
//       prefixIcon: Icon(
//         Icons.vpn_key,
//         color: Colors.black,
//       ),
//        suffixIcon: InkWell(
//             onTap: () => setState(() => _isSecret = !_isSecret),
//             child: Icon(
//               _isSecret ? Icons.visibility_off : Icons.visibility,
//               color: Colors.black,
//             ),
//           ),
//       labelText: 'Mot de passe',
//       labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
//       filled: true,
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       fillColor: Colors.purple.withOpacity(0.3),
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//           borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
//     )
//     );
    
    


    

//     //update button
//     final updatebutton = Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(90),
//       color: Colors.purple,
//       child: MaterialButton(
//           padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 00.0),
//           minWidth: MediaQuery.of(context).size.width,
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate()) {

//                     await FirebaseFirestore.instance
//                           .collection("volontaires")
//                           .doc(widget.id)
//                           .update({
//                             'email':  widget.newemail ?? widget.email ,
//                             'localisation': widget.newlocation ?? widget.location ,
//                             'mot de passe': widget.newpassword ?? widget.password,
//                             'nom': widget.newnom ?? widget.nom ,
//                             'numero': widget.newnumero ?? widget.numero
                        
                        
                        
                        
//                       });

//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => interadmin()));
//                     }
//                   },
//           child: Text(
//             "Modifier",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
//           )),
//     );




//     return Stack(children: [
    
//       Scaffold(
//       extendBodyBehindAppBar: true,
//            appBar: AppBar(
//        flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//           hexStringToColor("CB2B93"),
//           hexStringToColor("9546C4"),
//           hexStringToColor("5E61F4")
//         ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
//         ),
//         title: const Text(
//           "Modifier le compte",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         elevation: 20,
//         actions: [
//           IconButton(icon : Icon(Icons.logout),
//            onPressed: () {
//            FirebaseAuth.instance.signOut().then((value) {
//               print("Sortir"); 
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => interadmin()));
//             });
//           },

//           ),
//         ],
        
//       ),
//       body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(colors: [
//             hexStringToColor("FFFFFF"),
//             hexStringToColor("FFFFFF"),
//             hexStringToColor("FFFFFF")
//           ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//           child: SingleChildScrollView(
//               child: Form(
//                 key: _formKey,
//                 child: Padding(
//                           padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
//                           child: Column(
                
//                       children: <Widget>[
//                         NameField,
//                         SizedBox(height: 20),
              
//                         locationField,
//                         SizedBox(height: 20),
              
//                         NumField,
//                         SizedBox(height: 20),
              
//                         emailField,
//                         SizedBox(height: 20),
              
//                         passwordField,
//                         SizedBox(height: 20),
              
//                         updatebutton,
//                         SizedBox(height: 15),
//                       ],
//                     ),
//                   ),
//               ),
//               ),
//             ),
//           ),
//     ]);
//   }
  
//  }
