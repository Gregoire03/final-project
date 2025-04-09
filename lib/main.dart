import 'package:application_de_gestion_des_resources/formulaire_ajout_d_employe.dart';
import 'package:application_de_gestion_des_resources/home_page.dart';
import 'package:application_de_gestion_des_resources/tableau_de_bord.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(home: HomePage()));
}
