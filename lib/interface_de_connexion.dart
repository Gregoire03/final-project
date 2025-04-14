import 'package:application_de_gestion_des_resources/home_page.dart';
import 'package:application_de_gestion_des_resources/inscription.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterfaceDeConnexion extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Connexion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                  onPressed: () {
                    Get.to(Inscription());
                  },
                  child: Text('Créer un compte'))
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
