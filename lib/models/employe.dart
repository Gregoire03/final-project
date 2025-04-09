// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Employe {
  String nom;
  String prenom;
  String heure;
  String role;
  String numero;
  String email;
  String image;
  String arriver;
  String depart;
  Employe({
    required this.nom,
    required this.prenom,
    required this.heure,
    required this.role,
    required this.numero,
    required this.email,
    required this.image,
    required this.arriver,
    required this.depart,
  });


  Employe copyWith({
    String? nom,
    String? prenom,
    String? heure,
    String? role,
    String? numero,
    String? email,
    String? image,
    String? arriver,
    String? depart,
  }) {
    return Employe(
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      heure: heure ?? this.heure,
      role: role ?? this.role,
      numero: numero ?? this.numero,
      email: email ?? this.email,
      image: image ?? this.image,
      arriver: arriver ?? this.arriver,
      depart: depart ?? this.depart,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nom': nom,
      'prenom': prenom,
      'heure': heure,
      'role': role,
      'numero': numero,
      'email': email,
      'image': image,
      'arriver': arriver,
      'depart': depart,
    };
  }

  factory Employe.fromMap(Map<String, dynamic> map) {
    return Employe(
      nom: map['nom'] as String,
      prenom: map['prenom'] as String,
      heure: map['heure'] as String,
      role: map['role'] as String,
      numero: map['numero'] as String,
      email: map['email'] as String,
      image: map['image'] as String,
      arriver: map['arriver'] as String,
      depart: map['depart'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employe.fromJson(String source) => Employe.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Employe(nom: $nom, prenom: $prenom, heure: $heure, role: $role, numero: $numero, email: $email, image: $image, arriver: $arriver, depart: $depart)';
  }

  @override
  bool operator ==(covariant Employe other) {
    if (identical(this, other)) return true;
  
    return 
      other.nom == nom &&
      other.prenom == prenom &&
      other.heure == heure &&
      other.role == role &&
      other.numero == numero &&
      other.email == email &&
      other.image == image &&
      other.arriver == arriver &&
      other.depart == depart;
  }

  @override
  int get hashCode {
    return nom.hashCode ^
      prenom.hashCode ^
      heure.hashCode ^
      role.hashCode ^
      numero.hashCode ^
      email.hashCode ^
      image.hashCode ^
      arriver.hashCode ^
      depart.hashCode;
  }
}
