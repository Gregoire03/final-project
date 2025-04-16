import 'package:application_de_gestion_des_resources/detail_produit.dart';
import 'package:application_de_gestion_des_resources/home_page.dart';
import 'package:application_de_gestion_des_resources/inscription.dart';
import 'package:application_de_gestion_des_resources/profile.dart';
import 'package:application_de_gestion_des_resources/tableau_de_bord.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterfaceDeConnexion extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  
  final _nomController = TextEditingController();
  final _prenomController =TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(" Connexion," ,style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Nom d\'utilisateur',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom d\'utilisateur';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  var nom = _nomController.text;
                  var prenom = _prenomController;
                  var email = _emailController.text;
                  var mdp = _passwordController.text;

                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(email: email, password: mdp);

                  Get.to(HomePage());

                  // Action à effectuer lors de la connexion
                },
                child: const Text('Se connecter'),
              ),
              TextButton(
                  onPressed: () async{
                    var nom = _nomController.text;
                    var prenom = _prenomController.text;
                    var email = _emailController.text;
                    var mdp = _passwordController.text;

                    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: mdp);
                    Get.to(TableauDeBord());
                  },
                  child: TextButton(onPressed: () { 
                    Navigator.push(context, MaterialPageRoute(builder:(_)=> Inscription()
                    )
                    );
                   },
                  child: Text('Créer un compte')))
            ],
          ),
        ),
      ),
    );
  }

  void main() {
    runApp(MaterialApp(
      title: 'Application de Gestion des Ressources',
      home: InterfaceDeConnexion(),
    ));
  }
}

 
