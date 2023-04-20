// ignore_for_file: file_names, deprecated_member_use, prefer_const_literals_to_create_immutables, unnecessary_string_escapes, avoid_print, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_garbage_collection/Authentification/Auth_citoyen/Login_Citoyen.dart';
import 'package:smart_garbage_collection/Responsive/responsive.dart';
import 'package:smart_garbage_collection/screens/SocialPage.dart';
import 'package:smart_garbage_collection/Theme/header_widget.dart';
import 'package:smart_garbage_collection/Theme/theme_helper.dart';
//import 'package:app_projet_pfe/Pages/SocialPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/welcome_page.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ResetPasswordState();
  }
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  final double _headerHeight = 210;
  String? errorMessage;

//!forebase !!!
  final TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
//! end forebase !!!

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double w = MediaQuery.of(context).size.width;

    final styles =
        TextStyle(fontSize: size.height * 0.033, fontWeight: FontWeight.bold);
    // final styles = TextStyle(fontSize: 36, fontWeight: FontWeight.bold);

    double _drawerIconSize = 24;
    double _drawerFontSize = 17;
    return Scaffold(
      backgroundColor: Colors.white,
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
            icon: const Icon(Icons.notifications),
            onPressed: () {},
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true,
                  Icons.account_circle), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'Réinitialisation du mot de passe',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.alef(
                          textStyle: styles,
                          //  fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(218, 23, 23, 23),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      const Text(
                        'Entrer votre adresse e-mail pour réinitialiser le mot de passe',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 133, 133, 133)),
                      ),
                      const SizedBox(height: 5.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              //! Email descktop !!!!!!!!!!!!!!!!!!!!!!!!!!!/////
                              if (isDesktop(context))
                                Container(
                                  margin: EdgeInsets.only(
                                      left: w / 3.5, right: w / 3.5),
                                  // alignment: Alignment.center,
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: ThemeHelper().textInputDecoration(
                                        "Entrer votre adresse e-mail pour réinitialiser le mot de passe",
                                        "Entrer votre adresse e-mail"),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (val) {
                                      if (val!.isEmpty ||
                                          !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                              .hasMatch(val)) {
                                        return "Entrer une adresse e-mail valide !";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                              const SizedBox(height: 20.0),
                              //! !!!!!!!!!!!!!!!!!!!phone
                              //! Email phone !!!!!!!!!!!!!!!!!!!!!!
                              if (!isDesktop(context))
                                Container(
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: ThemeHelper()
                                        .textInputDecoration("Adresse e-mail",
                                            "Entrer votre e-mail"),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (val) {
                                      if (val!.isEmpty ||
                                          !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                              .hasMatch(val)) {
                                        return "Entrer une adresse e-mail valide";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                              const SizedBox(height: 20.0),

                              //! Bottom signin !!!!!!!!!!!!!!!!
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      " Réinitialiser ".toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      debugPrint(
                                          'Toutes les validations sont passées !!');
                                    }
                                    VerifeEmail(_emailController.text);
                                  },
                                ),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void VerifeEmail(String email) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      debugPrint("mriiiiiiiiiiiiiiiiiiiigl ");
      Fluttertoast.showToast(
          msg: "E-mail de réinitialisation du mot de passe envoyé");
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginCitoyen()));
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
      Navigator.of(context).pop();
    }
  }
}
