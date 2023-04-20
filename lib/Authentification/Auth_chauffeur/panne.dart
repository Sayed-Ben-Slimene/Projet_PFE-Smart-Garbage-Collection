// ignore_for_file: file_names, unused_field, unused_local_variable, deprecated_member_use, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_garbage_collection/Authentification/Auth_citoyen/Login_Citoyen.dart';
import 'package:smart_garbage_collection/UsersInfo/User.dart';
import 'package:smart_garbage_collection/UsersInfo/pannemadel.dart';
import 'package:smart_garbage_collection/mpas/ORServisesMaps.dart';
import 'package:smart_garbage_collection/screens/SocialPage.dart';
import 'package:smart_garbage_collection/Theme/header_widget.dart';
import 'package:smart_garbage_collection/Theme/theme_helper.dart';
////////////////

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_garbage_collection/screens/welcome_page.dart';

import '../../Responsive/responsive.dart';

class panne extends StatefulWidget {
  const panne({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _panneState();
  }
}

class _panneState extends State<panne> {
  final _formKey = GlobalKey<FormState>();
  static final List<String> items = <String>[
    'Panne camion',
    'panne technique',
  ];
  static final List<String> panne = <String>[
    '165 TUN 2025',
    '160 TUN 1025',
    '180 TUN 3582',
    '155 TUN 9950',
    '140 TUN 1351',
    '220 TUN 9613',
  ];

  // String? value;
//! firebase!!!!!!!!
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  String? camionvalue;
  String? pannevalue;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _panneController = TextEditingController();
  final TextEditingController _telController = TextEditingController();

//! firebase!!!!!!!!
  bool checkedValue = false;
  bool checkboxValue = false;
  final double _headerHeight = 210;

  @override
  Widget build(BuildContext context) {
    double _drawerIconSize = 24;
    double _drawerFontSize = 17;

    double w = MediaQuery.of(context).size.width;

    const styles = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );

    String? value;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          " Espace Chauffeur ",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ])),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(
              top: 16,
              right: 16,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_return_sharp),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ORServises()));
            },
          ),
        ],
      ),
      //!ssssssssssssssssssssssss//////////////////////////////////////////////
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [
                0.0,
                1.0
              ],
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.1),
                Theme.of(context).accentColor.withOpacity(0.3),
              ])),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 1.0],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Smart Garbage Collection",
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  size: _drawerIconSize,
                  color: Colors.black87,
                ),
                title: Text(
                  'Accueil',
                  style: TextStyle(
                    fontSize: _drawerFontSize,
                    color: Colors.black87,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomePage()));
                },
              ),
              const Divider(
                color: Colors.black87,
                height: 0.5,
              ),
              const Divider(
                color: Colors.black87,
                height: 0.5,
              ),
              ListTile(
                leading: Icon(
                  Icons.screen_lock_landscape_rounded,
                  size: _drawerIconSize,
                  color: Colors.black87,
                ),
                title: const Text(
                  'Social screen',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black87,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SocialPage()));
                },
              ),
              const Divider(
                color: Colors.black87,
                height: 0.5,
              ),
              const Divider(
                color: Colors.black87,
                height: 0.5,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  size: _drawerIconSize,
                  color: Colors.black87,
                ),
                title: Text(
                  'Se déconnecter',
                  style: TextStyle(
                    fontSize: _drawerFontSize,
                    color: Colors.black87,
                  ),
                ),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),
      ),
//////////////////////////////////////////////////////////////////
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),

                                ///icon user !!!!!!!!!!!!!!!!!
                                child: const Icon(
                                  Icons.error_outline,
                                  color: Color.fromARGB(255, 159, 158, 158),
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: const Icon(
                                  Icons.error_sharp,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          ' Déclarer une Panne ! ',
                          style: GoogleFonts.alef(
                            textStyle: styles,
                            //  fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(218, 23, 23, 23),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //!nom!!!!!!!
                        if (isDesktop(context))
                          Container(
                            margin:
                                EdgeInsets.only(left: w / 3.8, right: w / 3.8),
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                  "Nom et Prénom Chauffeur",
                                  "Entrer votre Nom"),
                              keyboardType: TextInputType.name,
                              controller: _nomController,
                              validator: (val) {
                                RegExp regex = RegExp(r'^.{3,}$');

                                if (val!.isEmpty) {
                                  return "Entrer votre Nom et Prénom !";
                                } else if (!regex.hasMatch(val)) {
                                  return "Entrez un nom valide (Min. 3 caractères)!";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                _nomController.text = val!;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                        if (isDesktop(context))
                          const SizedBox(
                            height: 20,
                          ),

                        if (isDesktop(context)) const SizedBox(height: 20.0),
//!telephone !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        if (isDesktop(context))
                          Container(
                            margin:
                                EdgeInsets.only(left: w / 3.8, right: w / 3.8),
                            child: TextFormField(
                              controller: _telController,
                              decoration: ThemeHelper().textInputDecoration(
                                  "Numéro de téléphone",
                                  "Entrez votre numéro de portable"),
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if (val!.isEmpty ||
                                    !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                  return "Entrez un numéro de téléphone valide";
                                } else if (val.length != 8) {
                                  return "Entrez un numéro de téléphone valide (8 chiffres)!";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                _telController.text = val!;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                        if (isDesktop(context)) const SizedBox(height: 20.0),
                        if (isDesktop(context))
                          //! dropdown_list
                          Container(
                            margin:
                                EdgeInsets.only(left: w / 3.8, right: w / 3.8),
                            // margin: EdgeInsets.only(left: w / 5, right: w / 5),
                            //width: 260,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 253, 253, 253)
                                          .withOpacity(0.5),
                                  blurRadius: 18,
                                  offset: const Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                  color: const Color.fromARGB(255, 89, 89, 89),
                                  width: 0),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField<String>(
                                hint: const Text(
                                  ' Identifier le Matricule de Camion  ',
                                ),
                                isExpanded: true,
                                iconSize: 30,
                                icon: const Icon(Icons.arrow_drop_down_sharp,
                                    color: Color.fromARGB(255, 26, 26, 26)),
                                items: panne.map(buildMenuItem).toList(),
                                onChanged: (val) => setState(
                                  () {
                                    val = val;
                                    camionvalue = val;
                                  },
                                ),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Veuillez sélectionner Matricule de Camion ';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        if (isDesktop(context)) const SizedBox(height: 20.0),
                        if (isDesktop(context))
                          //! dropdown_list
                          Container(
                            margin:
                                EdgeInsets.only(left: w / 3.8, right: w / 3.8),
                            // margin: EdgeInsets.only(left: w / 5, right: w / 5),
                            //width: 260,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 253, 253, 253)
                                          .withOpacity(0.5),
                                  blurRadius: 18,
                                  offset: const Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                  color: const Color.fromARGB(255, 89, 89, 89),
                                  width: 0),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField<String>(
                                hint: const Text(
                                  ' Type de Panne  ',
                                ),
                                isExpanded: true,
                                iconSize: 30,
                                icon: const Icon(Icons.arrow_drop_down_sharp,
                                    color: Color.fromARGB(255, 26, 26, 26)),
                                items: items.map(buildMenuItem).toList(),
                                onChanged: (val) => setState(
                                  () {
                                    val = val;
                                    pannevalue = val;
                                  },
                                ),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Veuillez sélectionner le Type de Panne';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),

                        ////////////////////////////////!telephone!!!!!!!!!!!!!!!!!!!
                        if (!isDesktop(context))
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                  "Nom et Prénom Chauffeur",
                                  "Entrer votre Nom"),
                              keyboardType: TextInputType.name,
                              controller: _nomController,
                              validator: (val) {
                                RegExp regex = RegExp(r'^.{3,}$');
                                if (val!.isEmpty) {
                                  return "Entrer votre Nom et Prénom !";
                                } else if (!regex.hasMatch(val)) {
                                  return "Entrez un nom valide (Min. 3 caractères)!";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                _nomController.text = val!;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                        if (!isDesktop(context)) const SizedBox(height: 20.0),

                        //!telephone !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        if (!isDesktop(context))
                          Container(
                            child: TextFormField(
                              controller: _telController,
                              decoration: ThemeHelper().textInputDecoration(
                                  "Numéro de téléphone",
                                  "Entrez votre numéro de portable"),
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if (val!.isEmpty ||
                                    !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                  return "Entrez un numéro de téléphone valide";
                                } else if (val.length != 8) {
                                  return "Entrez un numéro de téléphone valide (8 chiffres)!";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                _telController.text = val!;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                        if (!isDesktop(context)) const SizedBox(height: 20.0),
                        if (!isDesktop(context))
                          //! dropdown_list
                          Container(
                            // margin: EdgeInsets.only(left: w / 5, right: w / 5),
                            //width: 260,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 253, 253, 253)
                                          .withOpacity(0.5),
                                  blurRadius: 18,
                                  offset: const Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                  color: const Color.fromARGB(255, 89, 89, 89),
                                  width: 0),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField<String>(
                                hint: const Text(
                                  ' Identifier le Matricule de Camion  ',
                                ),
                                isExpanded: true,
                                iconSize: 30,
                                icon: const Icon(Icons.arrow_drop_down_sharp,
                                    color: Color.fromARGB(255, 26, 26, 26)),
                                items: panne.map(buildMenuItem).toList(),
                                onChanged: (val) => setState(
                                  () {
                                    val = val;
                                    camionvalue = val;
                                  },
                                ),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Veuillez sélectionner Matricule de Camion ';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        if (!isDesktop(context)) const SizedBox(height: 20.0),
                        if (!isDesktop(context))
                          //! dropdown_list
                          Container(
                            // margin: EdgeInsets.only(left: w / 5, right: w / 5),
                            //width: 260,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 253, 253, 253)
                                          .withOpacity(0.5),
                                  blurRadius: 18,
                                  offset: const Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                  color: const Color.fromARGB(255, 89, 89, 89),
                                  width: 0),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField<String>(
                                hint: const Text(
                                  ' Type de Panne  ',
                                ),
                                isExpanded: true,
                                iconSize: 30,
                                icon: const Icon(Icons.arrow_drop_down_sharp,
                                    color: Color.fromARGB(255, 26, 26, 26)),
                                items: items.map(buildMenuItem).toList(),
                                onChanged: (val) => setState(
                                  () {
                                    val = val;
                                    pannevalue = val;
                                  },
                                ),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Veuillez sélectionner le Type de Panne';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
//////!telephone!!!!!!!!!!!!!!!!!!!

                        const SizedBox(height: 25.0),
                        ////////////////////////////////bottom login !!!!!!!!!!!!!
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                " Déclarer ".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                postDetailsToFirestore();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,

        child: Text(
          item,
          style: const TextStyle(
            //fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color.fromARGB(255, 98, 98, 98),
          ),
        ), // Text
      ); // DropdownMenuItem

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    pannemodel panneModel = pannemodel();

    // writing all the values

    panneModel.uid = user?.uid;
    panneModel.nom = _nomController.text;
    panneModel.camion = camionvalue;
    panneModel.panne = pannevalue;
    panneModel.tel = _telController.text;

    await firebaseFirestore
        .collection("pannes")
        .doc(user!.uid)
        .set(panneModel.toMap())
        .then((uid) => {
              Fluttertoast.showToast(msg: "panne déclarée avec succès ! ) "),
              // ignore: prefer_const_constructors
              CircularProgressIndicator(),
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ORServises())),
            });
  }
}
