// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Utilisateur {
  String nom;
  String prenom;
  String email;
  String mdp;
  Utilisateur({
    required this.nom,
    required this.prenom,
    required this.email,
    required this.mdp,
  });

  Utilisateur copyWith({
    String? nom,
    String? prenom,
    String? email,
    String? mdp,
  }) {
    return Utilisateur(
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      email: email ?? this.email,
      mdp: mdp ?? this.mdp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'mdp': mdp,
    };
  }

  factory Utilisateur.fromMap(Map<String, dynamic> map) {
    return Utilisateur(
      nom: map['nom'] as String,
      prenom: map['prenom'] as String,
      email: map['email'] as String,
      mdp: map['mdp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Utilisateur.fromJson(String source) => Utilisateur.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Utilisateur(nom: $nom, prenom: $prenom, email: $email, mdp: $mdp)';
  }

  @override
  bool operator ==(covariant Utilisateur other) {
    if (identical(this, other)) return true;
  
    return 
      other.nom == nom &&
      other.prenom == prenom &&
      other.email == email &&
      other.mdp == mdp;
  }

  @override
  int get hashCode {
    return nom.hashCode ^
      prenom.hashCode ^
      email.hashCode ^
      mdp.hashCode;
  }
}
