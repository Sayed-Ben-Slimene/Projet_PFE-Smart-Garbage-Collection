// ignore_for_file: file_names
class ChauffeurModel {
  String? uid;
  String? email;
  String? nom;
  String? password;
  String? tel;
  ChauffeurModel({this.uid, this.email, this.nom, this.password, this.tel});

  // receiving data from server
  factory ChauffeurModel.fromMap(map) {
    return ChauffeurModel(
      uid: map['uid'],
      email: map['email'],
      nom: map['nom'],
      password: map['mot de passe'],
      tel: map['tel'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'nom': nom,
      'mot de passe': password,
      'tel': tel
    };
  }
}
