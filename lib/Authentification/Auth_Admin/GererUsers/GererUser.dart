// ignore_for_file: unused_import, file_names, deprecated_member_use, unnecessary_new, avoid_print, unused_local_variable

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_garbage_collection/Authentification/Auth_Admin/GererUsers/ConsulterUser/ConsulterCitoyen.dart';
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

import '../../../Responsive/responsive.dart';
import '../../../Theme/menu_item.dart';
import '../../../screens/welcome_page.dart';
import '../Dashboard_Admin.dart';
import 'ConsulterUser/ConsulterAgent.dart';
import 'ConsulterUser/ConsulterChauffeur.dart';

class GererUsers extends StatefulWidget {
  const GererUsers({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GererUsersState();
  }
}

class _GererUsersState extends State<GererUsers> {
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
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileAdmin()));
            },
          ),
          const Spacer(),
          Row(
            children: [
              NavItem(
                title: 'Espace Admin',
                tapEvent: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileAdmin()));
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
                    'Dashboard Administrateur',
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
                          //!sizebox citoyen!!!!!!!
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
                                                const ConsulterCitoyen()));
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset("images/citoyen.png",
                                              width: 105.0),
                                          const SizedBox(height: 20.0),

                                          const Text(
                                            "Gérer Citoyens",
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
                          //!chauffeur!!!!!!!!!!!!!!
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
                          //!agent!!!!!!!!!
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
                                                const ConsulterAgent()));
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Image.asset("images/agent.png",
                                              width: 105.0),
                                          const SizedBox(height: 21.0),
                                          const Text(
                                            "Gérer Agents",
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

                          //!phone!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                          if (!isDesktop(context))
                            Center(
                              child: SizedBox(
                                width: 180.0,
                                height: 150.0,
                                child: Card(
                                  color:
                                      const Color.fromARGB(255, 177, 174, 174),
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: new InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ConsulterCitoyen()));
                                    },
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Image.asset("images/citoyen.png",
                                                width: 70.0),
                                            const SizedBox(height: 18.0),
                                            const Text(
                                              "Gérer Citoyens",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0),
                                            ),
                                            // TextStyle, Text // TextStyle, Text
                                          ],
                                        ), // RoundedRectangleBorder
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          //!chauffeur!!!!!!!!!!!!!!
                          if (!isDesktop(context))
                            Center(
                              child: SizedBox(
                                width: 180.0,
                                height: 150.0,
                                child: Card(
                                  color:
                                      const Color.fromARGB(255, 177, 174, 174),
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
                                              width: 70.0,
                                            ),
                                            const SizedBox(height: 5.0),
                                            const Text(
                                              "Gérer Chauffeurs",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0),
                                            ),
                                            // TextStyle, Text // TextStyle, Text
                                          ],
                                        ), // RoundedRectangleBorder
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          //!agent!!!!!!!!!
                          if (!isDesktop(context))
                            Center(
                              child: SizedBox(
                                width: 180.0,
                                height: 150.0,
                                child: Card(
                                  color:
                                      const Color.fromARGB(255, 177, 174, 174),
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: new InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ConsulterAgent()));
                                    },
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Image.asset("images/agent.png",
                                                width: 70.0),
                                            const SizedBox(height: 15.0),
                                            const Text(
                                              "Gérer Agents",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0),
                                            ),
                                            // TextStyle, Text // TextStyle, Text
                                          ],
                                        ), // RoundedRectangleBorder
                                      ),
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
