// ignore_for_file: unused_import, file_names, deprecated_member_use, unnecessary_new, avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_garbage_collection/Authentification/Auth_Admin/GererUsers/ConsulterUser/ConsulterCitoyen.dart';
import 'package:smart_garbage_collection/Authentification/Auth_Admin/GererUsers/GererUser.dart';
import 'package:smart_garbage_collection/Authentification/Auth_citoyen/Login_Citoyen.dart';
import 'package:smart_garbage_collection/Authentification/Auth_citoyen/SignUp_Citoyen.dart';
import 'package:smart_garbage_collection/mpas/maps/Maps.dart';
import 'package:smart_garbage_collection/screens/SocialPage.dart';

import 'package:smart_garbage_collection/screens/Animation.dart';
import 'package:smart_garbage_collection/Theme/header_widget.dart';
import 'package:smart_garbage_collection/Theme/theme_helper.dart';
////////////////
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../Theme/menu_item.dart';
import '../../../../UsersInfo/User.dart';
import '../../../../screens/welcome_page.dart';
import '../../../Auth_Agent/Login_Agent.dart';

class UpdateCitoyen extends StatefulWidget {
  UpdateCitoyen(
      {Key? key,
      required this.email,
      // required this.location,
      required this.nom,
      required this.id,
      required this.password})
      : super(key: key);

  String email;
  // String location;
  String nom;
  String id;
  String password;

  final _formKey = GlobalKey<FormState>();

  String? newemail;
  // String? newlocation;
  String? newnom;
  String? newid;
  String? newpassword;

  @override
  _UpdateCitoyenState createState() => _UpdateCitoyenState();
}

class _UpdateCitoyenState extends State<UpdateCitoyen> {
  final _formKey = GlobalKey<FormState>();
  static final List<String> items = <String>[
    'Sidi massoud',
    'Centre Medina',
    'Hiboun',
    'Zahraa'
  ];
//! firebase!!!!!!!!
  // final TextEditingController _confirmPass = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  String? dropdownValue;
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _nomController = TextEditingController();
//! firebase!!!!!!!!
  bool checkedValue = false;
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
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
            icon: const Icon(
              Icons.keyboard_return,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const GererUsers()));
            },
          ),
          const Spacer(),
          Row(
            children: [
              NavItem(
                title: 'Espace Agent',
                tapEvent: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginAgent()));
                },
              ),
            ],
          ),
        ],
      ),
      ////////////////////////////////////////////////

      body: SafeArea(
        child: Stack(
          children: [
            const SizedBox(
              height: 100,
              child: HeaderWidget(100, false, Icons.house_rounded),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                                  Icons.admin_panel_settings,
                                  color: Color.fromARGB(255, 159, 158, 158),
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: const Icon(
                                  Icons.add_circle,
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
                        const Text(
                          'update Citoyens',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //!nom!!!!!!!
                        Container(
                          margin: EdgeInsets.only(left: w / 4, right: w / 4),
                          child: TextFormField(
                            initialValue: widget.nom,
                            onChanged: (newValue) => widget.newnom = newValue,
                            decoration: ThemeHelper().textInputDecoration(
                                "Nom et Prénom", "Entrez Nom"),
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              RegExp regex = new RegExp(r'^.{3,}$');
                              if (value!.isEmpty) {
                                return ("veuillez entrer votre nom d'utilisateur");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Entrez un nom valide (Min. 3 caractères)");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              widget.newnom = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //!email !!!!!!!!!!!!!!!
                        Container(
                          margin: EdgeInsets.only(left: w / 4, right: w / 4),
                          child: TextFormField(
                            initialValue: widget.email,
                            onChanged: (newValue) => widget.newemail = newValue,
                            decoration: ThemeHelper().textInputDecoration(
                                "Adresse e-mail", "Entrez votre e-mail"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("veuillez entrer votre email");
                              }
                              // reg expression for email validation
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Veuillez entrer un email valide");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              widget.newemail = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        //!password!!!!!!!!!!!!!!!!!!!!!!!
                        Container(
                          margin: EdgeInsets.only(left: w / 4, right: w / 4),
                          child: TextFormField(
                            initialValue: widget.password,
                            onChanged: (newValue) =>
                                widget.newpassword = newValue,

                            obscureText: true,

                            //controller: _pass,
                            decoration: ThemeHelper().textInputDecoration(
                                "Mot de passe", "Entrer votre mot de passe"),
                            validator: (value) {
                              RegExp regex = new RegExp(r'^.{6,}$');
                              if (value!.isEmpty) {
                                return ("Le mot de passe est requis pour la connexion");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Entrez un mot de passe valide (min. 6 caractères)");
                              }
                            },
                            onSaved: (value) {
                              widget.newpassword = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),

                        // //! dropdown_list
                        // Container(
                        //   margin: EdgeInsets.only(left: w / 4, right: w / 4),
                        //   // margin: EdgeInsets.only(left: w / 5, right: w / 5),
                        //   //width: 260,
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 20, vertical: 0),
                        //   decoration: BoxDecoration(
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: const Color.fromARGB(255, 253, 253, 253)
                        //             .withOpacity(0.5),
                        //         blurRadius: 20,
                        //         offset: const Offset(0, 2),
                        //       )
                        //     ],
                        //     borderRadius: BorderRadius.circular(40),
                        //     border: Border.all(
                        //         color: const Color.fromARGB(255, 89, 89, 89),
                        //         width: 1),
                        //   ),
                        //   child: DropdownButtonHideUnderline(
                        //     child: DropdownButtonFormField<String>(
                        //       hint: const Text(
                        //         'Entrer votre emplacement',
                        //       ),
                        //       isExpanded: true,
                        //       iconSize: 30,
                        //       icon: const Icon(Icons.arrow_drop_down_sharp,
                        //           color: Color.fromARGB(255, 26, 26, 26)),
                        //       items: items.map(buildMenuItem).toList(),
                        //       onChanged: (val) => setState(
                        //         () {
                        //           val = val;
                        //           dropdownValue = val;
                        //         },
                        //       ),
                        //       validator: (val) {
                        //         if (val == null || val.isEmpty) {
                        //           return 'Veuillez sélectionner un emplacement';
                        //         }
                        //         return null;
                        //       },
                        //     ),
                        //   ),
                        // ),

                        const SizedBox(height: 20.0),
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
                                "Enregistrer".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                FirebaseFirestore.instance
                                    .collection("Citoyens")
                                    .doc(widget.id)
                                    .update({
                                  'email': widget.newemail ?? widget.email,
                                  'mot de passe':
                                      widget.newpassword ?? widget.password,
                                  'nom': widget.newnom ?? widget.nom,
                                });

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ConsulterCitoyen()));
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

}
