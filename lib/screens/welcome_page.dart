// ignore_for_file: unused_local_variable, avoid_unnecessary_containers

import 'package:smart_garbage_collection/Theme/theme_helper.dart';
import 'package:smart_garbage_collection/screens/Animation.dart';
import 'package:smart_garbage_collection/screens/SocialPage.dart';
import 'package:smart_garbage_collection/Responsive/responsive.dart';
///////////////
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_garbage_collection/Theme/header.dart';
///////////////

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //responsive !!!
    Size size = MediaQuery.of(context).size;
    final style =
        TextStyle(fontSize: size.height * 0.03, fontWeight: FontWeight.bold);
    final styles =
        TextStyle(fontSize: size.height * 0.04, fontWeight: FontWeight.bold);

    //
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 35,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: isMobile(context)
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.center,
              crossAxisAlignment: !isMobile(context)
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.center,
              children: <Widget>[
                //   const SizedBox(height: 2),
                Container(
                  child: const Header(),
                ),

                if (isDesktop(context))
                  DelayedAnimation(
                    delay: 800,
                    child: Container(
                      height: 380,
                      margin: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Image.asset('images/Smart Garbage.png'),
                    ),
                  ),

                ///text smart garabage!!!!!!!!!!
                //  DelayedAnimation(
                // delay: 400,
                // child: Text(
                //  'Smart Garbage',
                //  style: GoogleFonts.alef(
                //    fontSize: size.height * 0.04,
                //    fontWeight: FontWeight.bold,
                //  fontWeight: FontWeight.bold,
                //     color: Color.fromARGB(218, 23, 23, 23),
                //    ),
                //   ),
                // ),
                if (!isDesktop(context))
                  DelayedAnimation(
                    delay: 800,
                    child: Container(
                      height: size.height * 0.4,
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Image.asset('images/Smart Garbage.png'),
                    ),
                  ),
                if (isDesktop(context))
                  DelayedAnimation(
                    delay: 1200,
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 30,
                        bottom: 30,
                        right: 80,
                        left: 80,
                      ),
                      child: Text(
                        "Ce système intelligent de gestion des déchets utilisant l'Internet des Objets, et connecté à des dispositifs qui affichent l'emplacement des poubelles et leur niveau de déchets.",
                        //"Cette Application est connectée à un appareil qui affiche l'emplacement et le niveau des déchets dans la poubelle",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 133, 133, 133),
                          fontSize: isDesktop(context) ? 20 : 16,
                        ),
                      ),
                    ),
                  ),
                if (!isDesktop(context))
                  DelayedAnimation(
                    delay: 1200,
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 30,
                        bottom: 30,
                      ),
                      child: Text(
                        "Ce système intelligent de gestion des déchets utilisant l'Internet des Objets, et connecté à des dispositifs qui affichent l'emplacement des poubelles et leur niveau de déchets.",
                        //"Cette Application est connectée à un appareil qui affiche l'emplacement et le niveau des déchets dans la poubelle",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 133, 133, 133),
                          fontSize: isDesktop(context) ? 20 : 15.5,
                        ),
                      ),
                    ),
                  ),
                DelayedAnimation(
                  delay: 1600,
                  child: Container(
                    decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: ElevatedButton(
                      style: ThemeHelper().buttonStyle(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text(
                          'Commencer',
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
                                builder: (context) => const SocialPage()));
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
