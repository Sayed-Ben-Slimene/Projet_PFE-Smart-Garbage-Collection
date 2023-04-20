// ignore_for_file: unused_import, file_names, deprecated_member_use, unnecessary_new, avoid_print, unused_local_variable

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_garbage_collection/Authentification/Auth_Admin/GererUsers/ConsulterUser/ConsulterCitoyen.dart';
import 'package:smart_garbage_collection/Authentification/Auth_Admin/GererUsers/ConsulterUser/consultercamion.dart';
import 'package:smart_garbage_collection/Authentification/Auth_citoyen/Login_Citoyen.dart';
import 'package:smart_garbage_collection/Authentification/Auth_citoyen/SignUp_Citoyen.dart';
import 'package:smart_garbage_collection/mpas/maps/Maps.dart';
import 'package:smart_garbage_collection/screens/SocialPage.dart';

import 'package:smart_garbage_collection/screens/Animation.dart';
import 'package:smart_garbage_collection/Theme/header_widget.dart';
import 'package:smart_garbage_collection/Theme/theme_helper.dart';
////////////////
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Responsive/responsive.dart';
import '../../Theme/menu_item.dart';
import '../../mpas/openstreet.dart';
import '../../screens/welcome_page.dart';
import '../Auth_Admin/GererUsers/ConsulterUser/ConsulterChauffeur.dart';
import '../Auth_Admin/GererUsers/GererUser.dart';
import '../Auth_Agent/Login_Agent.dart';
import '../Auth_Admin/GererUsers/ConsulterUser/ConsulterPoubelle.dart';
import '../Auth_Admin/GererUsers/ConsulterUser/consulterPanne.dart';
import '../Auth_Admin/Login_Admin.dart';

class ProfileAgent extends StatefulWidget {
  const ProfileAgent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfileAgentState();
  }
}

class _ProfileAgentState extends State<ProfileAgent> {
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
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.admin_panel_settings,
                      size: 80,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Espace Agent',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Wrap(
                        spacing: 20.0,
                        runSpacing: 20.0,
                        children: [
                          //!sizebox utilisateurs!!!!!!!
                          if (isDesktop(context))
                            SizedBox(
                              width: 200.0,
                              height: 200.0,
                              child: Card(
                                color: const Color.fromARGB(255, 177, 174, 174),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: new InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ConsulterChauffeurs()));
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/chauffeur.png",
                                            width: 90.0,
                                          ),
                                          const SizedBox(height: 10.0),
                                          const Text(
                                            "Gérer Chauffeurs",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0),
                                          ),
                                          const SizedBox(height: 5.0),
                                          // TextStyle, Text // TextStyle, Text
                                        ],
                                      ), // RoundedRectangleBorder
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          //!poubelles!!!!!!!!!!!!!!
                          if (isDesktop(context))
                            SizedBox(
                              width: 200.0,
                              height: 200.0,
                              child: Card(
                                color: const Color.fromARGB(255, 177, 174, 174),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: new InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ConsulterPoubelle()));
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/image.png",
                                            width: 101.0,
                                          ),
                                          const SizedBox(height: 10.0),
                                          const Text(
                                            "Gérer Poubelles",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0),
                                          ),
                                          const SizedBox(height: 5.0),
                                          const Text("1 Articles",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight
                                                      .w200)) // TextStyle, Text // TextStyle, Text
                                        ],
                                      ), // RoundedRectangleBorder
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          //!trajet!!!!!!!!!
                          if (isDesktop(context))
                            SizedBox(
                              width: 200.0,
                              height: 200.0,
                              child: Card(
                                color: const Color.fromARGB(255, 177, 174, 174),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: new InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ORServisesadmin()));
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset("images/route.png",
                                              width: 100.0),
                                          const SizedBox(height: 12.0),
                                          const Text(
                                            "Gérer Trajets",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0),
                                          ),
                                          const SizedBox(height: 5.0),
                                          const Text("1 Articles",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight
                                                      .w200)) // TextStyle, Text // TextStyle, Text
                                        ],
                                      ), // RoundedRectangleBorder
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          //!poubelle!!!!!!!!!
                          if (isDesktop(context))
                            SizedBox(
                              width: 200.0,
                              height: 200.0,
                              child: Card(
                                color: const Color.fromARGB(255, 177, 174, 174),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: new InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const consultercamion()));
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset("images/track.png",
                                              width: 140.0),
                                          const SizedBox(height: 20.0),
                                          const Text(
                                            "Gérer Camions",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0),
                                          ),
                                          const SizedBox(height: 5.0),
                                          const Text("1 Articles",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight
                                                      .w200)) // TextStyle, Text // TextStyle, Text
                                        ],
                                      ), // RoundedRectangleBorder
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (isDesktop(context))
                            SizedBox(
                              width: 200.0,
                              height: 200.0,
                              child: Card(
                                color: const Color.fromARGB(255, 177, 174, 174),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: new InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const consulterpanne()));
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset("images/error.png",
                                              width: 90.0),
                                          const SizedBox(height: 20.0),
                                          const Text(
                                            "Gérer Panne",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0),
                                          ),
                                          const SizedBox(height: 5.0),
                                          const Text("1 Articles",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight
                                                      .w200)) // TextStyle, Text // TextStyle, Text
                                        ],
                                      ), // RoundedRectangleBorder
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          //!phone!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                          if (!isDesktop(context))
                            SizedBox(
                              width: 140.0,
                              height: 140.0,
                              child: Card(
                                color: const Color.fromARGB(255, 177, 174, 174),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: new InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const GererUsers()));
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset("images/citoyen.png",
                                              width: 50.0),
                                          const SizedBox(height: 5.0),
                                          const Text(
                                            "Gérer Utilisateurs",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0),
                                          ),
                                          const SizedBox(height: 5.0),
                                          const Text("4 Articles",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight
                                                      .w200)) // TextStyle, Text // TextStyle, Text
                                        ],
                                      ), // RoundedRectangleBorder
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          //!poubelles!!!!!!!!!!!!!!
                          if (!isDesktop(context))
                            SizedBox(
                              width: 140.0,
                              height: 140.0,
                              child: Card(
                                color: const Color.fromARGB(255, 177, 174, 174),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: new InkWell(
                                  onTap: () {
                                    print("tapped");
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/image.png",
                                            width: 50.0,
                                          ),
                                          const SizedBox(height: 5.0),
                                          const Text(
                                            "Gérer Poubelles",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0),
                                          ),
                                          const SizedBox(height: 5.0),
                                          const Text("1 Articles",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight
                                                      .w200)) // TextStyle, Text // TextStyle, Text
                                        ],
                                      ), // RoundedRectangleBorder
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          //!trajet!!!!!!!!!
                          if (!isDesktop(context))
                            SizedBox(
                              width: 140.0,
                              height: 140.0,
                              child: Card(
                                color: const Color.fromARGB(255, 177, 174, 174),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: new InkWell(
                                  onTap: () {
                                    print("tapped");
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset("images/route.png",
                                              width: 50.0),
                                          const SizedBox(height: 5.0),
                                          const Text(
                                            "Gérer Trajets",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0),
                                          ),
                                          const SizedBox(height: 5.0),
                                          const Text("1 Articles",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight
                                                      .w200)) // TextStyle, Text // TextStyle, Text
                                        ],
                                      ), // RoundedRectangleBorder
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          //!poubelle!!!!!!!!!
                          if (!isDesktop(context))
                            SizedBox(
                              width: 140.0,
                              height: 140.0,
                              child: Card(
                                color: const Color.fromARGB(255, 177, 174, 174),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: new InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginAdmin()));
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset("images/track.png",
                                              width: 60.0),
                                          const SizedBox(height: 14.0),
                                          const Text(
                                            "Gérer Camions",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0),
                                          ),
                                          const SizedBox(height: 5.0),
                                          const Text("1 Articles",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight
                                                      .w200)) // TextStyle, Text // TextStyle, Text
                                        ],
                                      ), // RoundedRectangleBorder
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ), // Wrap
                    ), // Center
                  ), // Padding
                ],
              ),
            ),
            // Padding
          ],
        ),
      ),
    );
  }
}
