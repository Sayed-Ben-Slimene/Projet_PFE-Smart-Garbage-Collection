import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_garbage_collection/screens/welcome_page.dart';

class ListePatients extends StatefulWidget {
  const ListePatients({Key? key}) : super(key: key);

  @override
  State<ListePatients> createState() => _ListePatientsState();
}

class _ListePatientsState extends State<ListePatients> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          title: const Text('Liste des patients'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 241, 187, 36)),
            onPressed: () {
              // passing this to our root
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('patients').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return ListTile(
                  leading: const Icon(Icons.person),
                  iconColor: Colors.white,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          final collection =
                              FirebaseFirestore.instance.collection('patients');
                          collection
                                  .doc(document.id) // <-- Doc ID to be deleted.
                                  .delete() // <-- Delete
                              ;
                        },
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                      )
                    ],
                  ),
                  title: Text(data['Nom'],
                      style: const TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontSize: 20)),
                  subtitle: Text(data['Numero'],
                      style: const TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontSize: 20)),
                );
              }).toList(),
            );
          },
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 120),
          width: double.infinity,
          // ignore: deprecated_member_use
          child: FlatButton(
              child: const Text(
                'Ajouter un patient ',
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () => {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return const WelcomePage();
                    }))
                  },
              color: const Color.fromARGB(255, 241, 187, 36),
              textColor: Colors.white),
        ),
      ),
    ]);
  }
}
