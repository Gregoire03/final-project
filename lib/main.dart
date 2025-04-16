import 'package:application_de_gestion_des_resources/detail_produit.dart';
import 'package:application_de_gestion_des_resources/formulaire_ajout_d_employe.dart';
import 'package:application_de_gestion_des_resources/formulaire_ajout_de_stock.dart';
import 'package:application_de_gestion_des_resources/home_page.dart';
import 'package:application_de_gestion_des_resources/inscription.dart';
import 'package:application_de_gestion_des_resources/interface_de_connexion.dart';
import 'package:application_de_gestion_des_resources/inventaire.dart';
import 'package:application_de_gestion_des_resources/models/utilisateur.dart';
import 'package:application_de_gestion_des_resources/profile.dart';
import 'package:application_de_gestion_des_resources/profile.dart' as tableau;
import 'package:application_de_gestion_des_resources/tableau_de_bord.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance.currentUser != null
      ? email = FirebaseAuth.instance.currentUser!.email!
      : null;
  runApp(GetMaterialApp(
      home: FirebaseAuth.instance.currentUser != null
          ? TableauDeBord()
          : InterfaceDeConnexion()
          ));
}
