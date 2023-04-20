// ignore_for_file: file_names, deprecated_member_use, unnecessary_string_escapes

import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_garbage_collection/Authentification/Auth_Agent/Login_Agent.dart';
import 'package:smart_garbage_collection/Responsive/responsive.dart';
//import 'package:smart_garbage_collection/Theme/header.dart';
import 'package:smart_garbage_collection/Theme/menu_item.dart';
//import 'package:smart_garbage_collection/screens/SocialPage.dart';
//import 'package:smart_garbage_collection/screens/Animation.dart';
import 'package:smart_garbage_collection/Theme/header_widget.dart';
import 'package:smart_garbage_collection/Theme/theme_helper.dart';
import 'package:smart_garbage_collection/screens/welcome_page.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Dashboard_Admin.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginAdminState();
  }
}

class _LoginAdminState extends State<LoginAdmin> {
  final _formKey = GlobalKey<FormState>();
  final double _headerHeight = 210;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    const styles = TextStyle(fontSize: 36, fontWeight: FontWeight.bold);

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
            icon: const Icon(Icons.home_filled),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()));
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

//////////////////////////////////////////////////////////////////
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: isMobile(context)
              ? MainAxisAlignment.center
              : MainAxisAlignment.center,
          crossAxisAlignment: !isMobile(context)
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.center,
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
                        'Espace Admin',
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
                      const SizedBox(height: 27.0),
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
                                    // controller: _emailController,
                                    decoration: ThemeHelper()
                                        .textInputDecoration("Adresse e-mail",
                                            "Entrer votre adresse e-mail"),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (val) {
                                      if (val!.isEmpty ||
                                          val != "sayedbenslimane@gmail.com" ||
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

                              //! password descktop !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//////
                              if (isDesktop(context))
                                Container(
                                  margin: EdgeInsets.only(
                                      left: w / 3.5, right: w / 3.5),
                                  child: TextFormField(
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    //controller: _passwordController,
                                    decoration: ThemeHelper()
                                        .textInputDecoration('Mot de passe',
                                            'Entrer votre mot de passe'),
                                    validator: (val) {
                                      if (val!.isEmpty || val != "sayed12345") {
                                        return "Entrer votre mot de passe";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                              /** if (isDesktop(context))
                                const SizedBox(height: 20.0),
                              / forgot password descktop !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//////
                                 if (isDesktop(context))
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {

                                    },
                                    child: const Text(
                                      "Mot de passe oublié?",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 133, 133, 133),
                                      ),
                                    ),
                                  ),
                                ),*/

                              //! !!!!!!!!!!!!!!!!!!!phone
                              //! Email phone !!!!!!!!!!!!!!!!!!!!!!
                              if (!isDesktop(context))
                                Container(
                                  child: TextFormField(
                                    // controller: _emailController,
                                    decoration: ThemeHelper()
                                        .textInputDecoration("Adresse e-mail",
                                            "Entrer votre e-mail"),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (val) {
                                      if (val!.isEmpty ||
                                          val != "sayedbenslimane@gmail.com" ||
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
                                    decoration: ThemeHelper()
                                        .textInputDecoration('Mot de passe',
                                            'Entrer votre mot de passe'),
                                    validator: (val) {
                                      if (val!.isEmpty || val != "sayed12345") {
                                        return "Entrer votre mot de passe";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                              /**     //! forgot password phone !!!!!!!!!!!!!!!!!!!!!!
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
                                                const RegistrationCitoyen()),
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
                                ),*/
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
                                      Fluttertoast.showToast(
                                          msg: "Connexion réussie");
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProfileAdmin()),
                                          (Route<dynamic> route) => false);
                                    }
                                  },
                                ),
                              ),
                              /**  Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  const TextSpan(
                                      text: "Don\'t have an account? "),
                                  TextSpan(
                                    text: 'Create',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegistrationCitoyen()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ])),
                              ),
                              */
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
}
