// ignore_for_file: file_names
class pannemodel {
  String? uid;
  String? nom;
  String? tel;
  String? camion;
  String? panne;
  pannemodel({this.uid, this.nom, this.tel, this.panne, this.camion});

  // receiving data from server
  factory pannemodel.fromMap(map) {
    return pannemodel(
      uid: map['uid'],
      camion: map['camion'],
      nom: map['nom'],
      panne: map['panne'],
      tel: map['tel'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'panne': panne,
      'nom': nom,
      'camion': camion,
      'tel': tel
    };
  }
}
