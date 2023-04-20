// ignore_for_file: file_names, unused_field, deprecated_member_use, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_garbage_collection/Authentification/Auth_chauffeur/Login_chauffeur.dart';
import 'package:smart_garbage_collection/Theme/header_widget.dart';
import 'package:smart_garbage_collection/Theme/theme_helper.dart';
import 'package:smart_garbage_collection/screens/SocialPage.dart';
/////////////
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Responsive/responsive.dart';
import '../../UsersInfo/ChauffeurModel.dart';
import '../../screens/welcome_page.dart';

class RegistrationChauffeur extends StatefulWidget {
  const RegistrationChauffeur({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegistrationChauffeurState();
  }
}

class _RegistrationChauffeurState extends State<RegistrationChauffeur> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  final double _headerHeight = 210;
  final double _drawerIconSize = 24;
  final double _drawerFontSize = 17;

//! firebase!!!!!!!!
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  String? dropdownValue;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
//! firebase!!!!!!!!
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    const styles = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginChauffeur()));
            },
          ),
        ],
      ),
      ////////////////////////////////////////////////
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
                  'Logout',
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
                                  Icons.person,
                                  color: Color.fromARGB(255, 159, 158, 158),
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: const Icon(
                                  Icons.person_add_rounded,
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
                          'Créer un nouveau compte',
                          style: GoogleFonts.alef(
                            textStyle: styles,
                            //  fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(218, 23, 23, 23),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        ///! istelephone !!!!!!
                        //!nom!!!!!!!
                        if (!isDesktop(context))
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                  "Nom et Prénom", "Entrer votre Nom"),
                              keyboardType: TextInputType.name,
                              controller: _nomController,
                              validator: (val) {
                                // ignore: unnecessary_new
                                RegExp regex = new RegExp(r'^.{3,}$');
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
                        //!email!!!
                        if (!isDesktop(context))
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                  "Adresse e-mail", "Entrez votre e-mail"),
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              validator: (val) {
                                if (val!.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                        .hasMatch(val)) {
                                  return "Entrer une adresse e-mail valide !";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                _emailController.text = val!;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                        if (!isDesktop(context)) const SizedBox(height: 20.0),

                        //!password!!!!!!!!!!!!!!!!!!!!!!!
                        if (!isDesktop(context))
                          Container(
                            child: TextFormField(
                              obscureText: true,
                              controller: _passwordController,
                              //controller: _pass,
                              decoration: ThemeHelper().textInputDecoration(
                                  "Mot de passe", "Entrer votre mot de passe"),
                              validator: (val) {
                                RegExp regex = RegExp(r'^.{6,}$');
                                if (val!.isEmpty) {
                                  return "Entrer votre Mot de passe !";
                                } else if (!regex.hasMatch(val)) {
                                  return "Entrez Mot de passe valide (Min. 6 caractères)!";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                _passwordController.text = val!;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                        if (!isDesktop(context)) const SizedBox(height: 20.0),
                        //!confirm password!!!!!!!!!!!!!!!!!!!!!!!
                        if (!isDesktop(context))
                          Container(
                            child: TextFormField(
                              obscureText: true,
                              controller: _confirmPass,
                              decoration: ThemeHelper().textInputDecoration(
                                  "Confirmer votre Mot de passe",
                                  "Confirmer votre Mot de passe"),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Récrire votre mot de passe !";
                                }
                                if (val != _passwordController.text) {
                                  return "Le mot de passe ne correspond pas !";
                                }
                                return null;
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

                        ///!  is telephone:!!!!!!
                        ///!  isDesktop!!!!!!!!
                        ///!nom!!!!!!!
                        if (isDesktop(context))
                          Container(
                            margin:
                                EdgeInsets.only(left: w / 3.8, right: w / 3.8),
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                  "Nom et Prénom", "Entrez Nom"),
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
                        if (isDesktop(context)) const SizedBox(height: 20.0),

                        //!email!!!
                        if (isDesktop(context))
                          Container(
                            margin:
                                EdgeInsets.only(left: w / 3.8, right: w / 3.8),
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                  "Adresse e-mail", "Entrez votre e-mail"),
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              validator: (val) {
                                if (val!.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                        .hasMatch(val)) {
                                  return "Entrer une adresse e-mail valide !";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                _emailController.text = val!;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                        if (isDesktop(context)) const SizedBox(height: 20.0),

                        //!password!!!!!!!!!!!!!!!!!!!!!!!
                        if (isDesktop(context))
                          Container(
                            margin:
                                EdgeInsets.only(left: w / 3.8, right: w / 3.8),
                            child: TextFormField(
                              obscureText: true,
                              controller: _passwordController,
                              //controller: _pass,
                              decoration: ThemeHelper().textInputDecoration(
                                  "Mot de passe", "Entrer votre mot de passe"),
                              validator: (val) {
                                RegExp regex = RegExp(r'^.{6,}$');
                                if (val!.isEmpty) {
                                  return "Entrer votre Mot de passe !";
                                } else if (!regex.hasMatch(val)) {
                                  return "Entrez Mot de passe valide (Min. 6 caractères)!";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                _passwordController.text = val!;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                        if (isDesktop(context)) const SizedBox(height: 20.0),
                        //!confirm password!!!!!!!!!!!!!!!!!!!!!!!
                        if (isDesktop(context))
                          Container(
                            margin:
                                EdgeInsets.only(left: w / 3.8, right: w / 3.8),
                            child: TextFormField(
                              obscureText: true,
                              controller: _confirmPass,
                              decoration: ThemeHelper().textInputDecoration(
                                  "Confirmer votre Mot de passe",
                                  "Confirmer votre Mot de passe"),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Récrire votre mot de passe !";
                                }
                                if (val != _passwordController.text) {
                                  return "Le mot de passe ne correspond pas !";
                                }
                                return null;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
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

                        ///! isdesctop!!!!!!!!
                        ////////////////////////////////bottom login !!!!!!!!!!!!!
                        const SizedBox(height: 20.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "S'inscrire".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                signUp(_emailController.text,
                                    _passwordController.text);
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          //child: Text('Don\'t have an account? Create'),
                          child: Text.rich(TextSpan(children: [
                            const TextSpan(text: "Vous avez un compte ? "),
                            TextSpan(
                              text: 'Connecter',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginChauffeur()));
                                },
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor),
                            ),
                          ])),
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

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            )
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Connexion réussie"),
                  postDetailsToFirestore(),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginChauffeur())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Votre adresse e-mail semble être malformée.";

            break;
          case "wrong-password":
            errorMessage = "Votre mot de passe est erroné.";
            break;
          case "user-not-found":
            errorMessage = "L'utilisateur avec cet email n'existe pas.";
            break;
          case "user-disabled":
            errorMessage = "L'utilisateur avec cet e-mail a été désactivé.";
            break;
          case "too-many-requests":
            errorMessage = "Trop de demandes";
            break;
          case "operation-not-allowed":
            errorMessage =
                "La connexion avec un e-mail et un mot de passe n'est pas activée.";
            break;
          default:
            errorMessage = "Une erreur indéfinie s'est produite.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    ChauffeurModel userModel = ChauffeurModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.nom = _nomController.text;
    userModel.password = _passwordController.text;
    userModel.tel = _telController.text;

    await firebaseFirestore
        .collection("Chauffeurs")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: " Compte créer avec succès:) ");
  }
}
