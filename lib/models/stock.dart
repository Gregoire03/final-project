// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Stock {
    String nom;
  String categorie;
  String quantite;
  String prixunitair;
  String reference;
  String image;
  Stock({
    required this.nom,
    required this.categorie,
    required this.quantite,
    required this.prixunitair,
    required this.reference,
    required this.image,
  });
    

  Stock copyWith({
    String? nom,
    String? categorie,
    String? quantite,
    String? prixunitair,
    String? reference,
    String? image,
  }) {
    return Stock(
      nom: nom ?? this.nom,
      categorie: categorie ?? this.categorie,
      quantite: quantite ?? this.quantite,
      prixunitair: prixunitair ?? this.prixunitair,
      reference: reference ?? this.reference,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nom': nom,
      'categorie': categorie,
      'quantite': quantite,
      'prixunitair': prixunitair,
      'reference': reference,
      'image': image,
    };
  }

  factory Stock.fromMap(Map<String, dynamic> map) {
    return Stock(
      nom: map['nom'] as String,
      categorie: map['categorie'] as String,
      quantite: map['quantite'] as String,
      prixunitair: map['prixunitair'] as String,
      reference: map['reference'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Stock.fromJson(String source) => Stock.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Stock(nom: $nom, categorie: $categorie, quantite: $quantite, prixunitair: $prixunitair, reference: $reference, image: $image)';
  }

  @override
  bool operator ==(covariant Stock other) {
    if (identical(this, other)) return true;
  
    return 
      other.nom == nom &&
      other.categorie == categorie &&
      other.quantite == quantite &&
      other.prixunitair == prixunitair &&
      other.reference == reference &&
      other.image == image;
  }

  @override
  int get hashCode {
    return nom.hashCode ^
      categorie.hashCode ^
      quantite.hashCode ^
      prixunitair.hashCode ^
      reference.hashCode ^
      image.hashCode;
  }
  }
