// ignore_for_file: file_names, unnecessary_import, prefer_final_fields, deprecated_member_use, unnecessary_string_escapes, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_garbage_collection/Authentification/Auth_chauffeur/SignUp_Chauffeur.dart';
import 'package:smart_garbage_collection/Responsive/responsive.dart';
////////////
import 'package:smart_garbage_collection/Theme/header_widget.dart';
import 'package:smart_garbage_collection/Theme/theme_helper.dart';
import 'package:smart_garbage_collection/screens/SocialPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../mpas/ORServisesMaps.dart';
import '../../screens/welcome_page.dart';
import '../ResetPassword.dart';

class LoginChauffeur extends StatefulWidget {
  const LoginChauffeur({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginChauffeurState();
  }
}

class _LoginChauffeurState extends State<LoginChauffeur> {
  final _formKey = GlobalKey<FormState>();
  double _headerHeight = 210;

//!forebase !!!
  final _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  String? errorMessage;
//! end forebase !!!
  @override
  Widget build(BuildContext context) {
    const styles = TextStyle(fontSize: 34, fontWeight: FontWeight.bold);
    double _drawerIconSize = 24;
    double _drawerFontSize = 17;
    double w = MediaQuery.of(context).size.width;

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
            icon: const Icon(Icons.keyboard_return_sharp),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SocialPage()));
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
                  FirebaseAuth.instance.signOut().then((value) {
                    print("Signed Out");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginChauffeur()));
                  });
                },
              ),
            ],
          ),
        ),
      ),
//////////////////////////////////////////////////////////////////
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
                        'Espace Chauffeur',
                        style: GoogleFonts.alef(
                          textStyle: styles,
                          //  fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(218, 23, 23, 23),
                        ),
                      ),
                      const Text(
                        'Connectez-vous à votre compte',
                        style: TextStyle(
                            color: Color.fromARGB(255, 133, 133, 133)),
                      ),
                      const SizedBox(height: 30.0),
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
                                    decoration: ThemeHelper()
                                        .textInputDecoration("Adresse e-mail",
                                            "Entrer votre adresse e-mail"),
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
                              const SizedBox(height: 30.0),
                              //! password descktop !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//////
                              if (isDesktop(context))
                                Container(
                                  margin: EdgeInsets.only(
                                      left: w / 3.5, right: w / 3.5),
                                  child: TextFormField(
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    controller: _passwordController,
                                    decoration: ThemeHelper()
                                        .textInputDecoration('Mot de passe',
                                            'Entrer votre mot de passe'),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Entrer votre mot de passe";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                              if (isDesktop(context))
                                const SizedBox(height: 20.0),
                              //! forgot password descktop !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//////
                              if (isDesktop(context))
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ResetPassword()),
                                      );
                                    },
                                    child: const Text(
                                      "Mot de passe oublié?",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 133, 133, 133),
                                      ),
                                    ),
                                  ),
                                ),

                              //! !!!!!!!!!!!!!!!!!!!phone
                              //! Email phone !!!!!!!!!!!!!!!!!!!!!!
                              if (!isDesktop(context))
                                Container(
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: ThemeHelper()
                                        .textInputDecoration("Adresse e-mail",
                                            "Entrer votre e-mail"),
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
                              //! password phone !!!!!!!!!!!!!!!!!!!!!!
                              if (!isDesktop(context))
                                Container(
                                  child: TextFormField(
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    controller: _passwordController,
                                    decoration: ThemeHelper()
                                        .textInputDecoration('Mot de passe',
                                            'Entrer votre Mot de passe'),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Entrer votre Mot de passe";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                              //! forgot password phone !!!!!!!!!!!!!!!!!!!!!!
                              const SizedBox(height: 15.0),
                              if (!isDesktop(context))
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ResetPassword()),
                                      );
                                    },
                                    child: const Text(
                                      "Mot de passe oublié?",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 133, 133, 133),
                                      ),
                                    ),
                                  ),
                                ),
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
                                      " connection ".toUpperCase(),
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
                                    signIn(_emailController.text,
                                        _passwordController.text);
                                  },
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  const TextSpan(
                                      text: "Vous n'avez pas de compte ? "),
                                  TextSpan(
                                    text: 'Créer',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegistrationChauffeur()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ])),
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

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Connexion réussie"),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ORServises())),
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
}
