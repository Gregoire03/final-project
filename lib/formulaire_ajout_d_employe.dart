import 'package:application_de_gestion_des_resources/firebase.dart';
import 'package:application_de_gestion_des_resources/formulaire_ajout_de_stock.dart';
import 'package:application_de_gestion_des_resources/models/employe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FormulaireAjoutDEmploye extends StatelessWidget {
  FormulaireAjoutDEmploye({super.key});

  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController heuresController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController arriverController = TextEditingController();
  final TextEditingController departController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Ajouter un employé",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                // Nom
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer votre nom";
                    }
                    return null;
                  },
                  controller: nomController,
                  decoration: const InputDecoration(
                    labelText: "Nom",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40),
                // Prénom
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer votre prénom";
                    }
                    return null;
                  },
                  controller: prenomController,
                  decoration: const InputDecoration(
                    labelText: "Prénom",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40),
                // Rôle
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer votre rôle";
                    }
                    return null;
                  },
                  controller: roleController,
                  decoration: const InputDecoration(
                    labelText: "Rôle",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40),
                // E-mail
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer un e-mail";
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return "Veuillez entrer un e-mail valide";
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "E-mail",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40),
                // Téléphone
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer un numéro de téléphone";
                    }
                    if (!RegExp(r'^\d+$').hasMatch(value)) {
                      return "Veuillez entrer un numéro de téléphone valide";
                    }
                    return null;
                  },
                  controller: telephoneController,
                  decoration: const InputDecoration(
                    labelText: "Téléphone",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40),
                // Heures de travail
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer les heures de travail";
                    }
                    return null;
                  },
                  controller: heuresController,
                  decoration: const InputDecoration(
                    labelText: "Heures de travail",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40),
                // Image
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer une image";
                    }
                    return null;
                  },
                  controller: imageController,
                  decoration: const InputDecoration(
                    labelText: "Image",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40),
                // Heure d'arrivée
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer votre heure d'arrivée";
                    }
                    return null;
                  },
                  controller: arriverController,
                  decoration: const InputDecoration(
                    labelText: "Heure d'arrivée",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40),
                // Heure de départ
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer votre heure de départ";
                    }
                    return null;
                  },
                  controller: departController,
                  decoration: const InputDecoration(
                    labelText: "Heure de départ",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40),
                // Bouton Ajouter
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      var employe = Employe(
                        nom: nomController.text,
                        prenom: prenomController.text,
                        heure: heuresController.text,
                        role: roleController.text,
                        numero: telephoneController.text,
                        email: emailController.text,
                        image: imageController.text,
                        arriver: arriverController.text,
                        depart: departController.text,
                      );
                      FirebaseFirestore.instance
                          .collection("Employes")
                          .doc(nomController.text)
                          .set(employe.toMap());
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>  FormulaireAjoutDEmploye()));
                    }
                  },
                  child: const Text("Ajouter"),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}