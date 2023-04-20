// ignore_for_file: file_names, unused_field, non_constant_identifier_names, unused_local_variable, deprecated_member_use, duplicate_ignore

import 'package:flutter/services.dart';
import 'package:smart_garbage_collection/Authentification/Auth_chauffeur/Login_chauffeur.dart';
import 'package:smart_garbage_collection/Authentification/Auth_citoyen/Login_Citoyen.dart';
////////////
import 'package:smart_garbage_collection/Theme/theme_helper.dart';
import 'package:smart_garbage_collection/screens/Animation.dart';
import 'package:smart_garbage_collection/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({Key? key}) : super(key: key);
  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  final double _drawerIconSize = 30;
  final double _drawerFontSize = 20;
  final Color _Color = Colors.black;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final style =
        TextStyle(fontSize: size.height * 0.032, fontWeight: FontWeight.bold);
    const styles = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 49, 49, 49)),
        actions: [
          Container(
            margin: const EdgeInsets.only(
              top: 16,
              right: 16,
            ),
          ),
          // const SizedBox(width: 10),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.home_rounded, size: 28),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()));
            },
          ),
        ],
      ),
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
                Theme.of(context).primaryColor.withOpacity(0.2),
                Theme.of(context).accentColor.withOpacity(0.5),
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
                title: Text(
                  'Social screen',
                  style: TextStyle(
                    fontSize: _drawerFontSize,
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
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 223, 61, 61),
            gradient: LinearGradient(colors: [
              (Color.fromARGB(239, 255, 255, 255)),
              Color.fromARGB(239, 255, 255, 255)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 10),
              DelayedAnimation(
                delay: 200,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
                  width: double.infinity,
                  height: size.height * 0.30,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: null,
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('images/citoyen.png'),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 400,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: ElevatedButton(
                      style: ThemeHelper().buttonStyle(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text(
                          '   Citoyen   ',
                          style: GoogleFonts.poppins(
                            textStyle: style,
                            //  fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      onPressed: () {
                        //After successful login we will redirect to profile page. Let's create profile page now
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginCitoyen()));
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DelayedAnimation(
                delay: 600,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 90, vertical: 0.0),
                  width: double.infinity,
                  height: size.height * 0.35,
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('images/chauffeur.png'),
                ),
              ),
              const SizedBox(height: 0.0),
              DelayedAnimation(
                delay: 800,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: ElevatedButton(
                      style: ThemeHelper().buttonStyle(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text(
                          'Chauffeur',
                          style: GoogleFonts.poppins(
                            textStyle: style,
                            //  fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      onPressed: () {
                        //After successful login we will redirect to profile page. Let's create profile page now
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginChauffeur()));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
