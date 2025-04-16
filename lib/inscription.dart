import 'package:application_de_gestion_des_resources/home_page.dart';
import 'package:application_de_gestion_des_resources/models/utilisateur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inscription extends StatelessWidget {
  Inscription({super.key});

  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final emailController = TextEditingController();
  final mdpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Inscription",style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ), ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: nomController,
              decoration: InputDecoration(
                label: Text("Entrez votre nom"),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              controller: prenomController,
              decoration: InputDecoration(
                label: Text("Entrez votre Prenom"),
                border:OutlineInputBorder()
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text("Entrez votre email"),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              controller: mdpController,
              decoration: InputDecoration(
                label: Text("Entrez un mot de passe"),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    var email = emailController.text;
                    var mdp = mdpController.text;
                    var prenom = prenomController.text;
                    var nom = nomController.text;

                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email, password: mdp);

                    var utilisateur = Utilisateur(
                        nom: nom, prenom: prenom, email: email, mdp: mdp, );
                    await FirebaseFirestore.instance
                        .collection('Utilisateurs')
                        .doc(email)
                        .set(utilisateur.toMap());

                    Get.to(HomePage());
                  } on FirebaseAuthException catch (e) {
                    String message = '';

                    if (e.code == 'weak-password') {
                      message = 'Mot de passe trop faible.';
                    } else if (e.code == 'email-already-in-use') {
                      message = 'Cet email est déjà utilisé.';
                    } else if (e.code == 'invalid-email') {
                      message = 'Email invalide.';
                    } else {
                      message = 'Erreur : ${e.message}';
                    }

                    Get.snackbar(
                      'Erreur d\'inscription',
                      message,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: const Color(0xFFB00020),
                      colorText: Colors.white,
                      margin: const EdgeInsets.all(12),
                      duration: const Duration(seconds: 4),
                    );
                  }
                },
                child: Text("S'inscrire"))
          ],
        ),
      ),
    );
  }
}
