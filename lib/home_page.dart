import 'package:application_de_gestion_des_resources/formulaire_ajout_d_employe.dart';
import 'package:application_de_gestion_des_resources/main.dart';
import 'package:application_de_gestion_des_resources/models/employe.dart';
import 'package:application_de_gestion_des_resources/profil_employee.dart';
import 'package:application_de_gestion_des_resources/profile.dart';
import 'package:application_de_gestion_des_resources/profile_page.dart'; // Ensure this is the correct path
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
      FirebaseAuth.instance.currentUser != null
      ? email = FirebaseAuth.instance.currentUser!.email!
      : null;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Listes de tout les employé",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [Container(
          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: IconButton(onPressed: () {
            Get.to(
              Profile()
          );
          }, icon: Icon(Icons.person)))],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Employes").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          var employes = [];
          for (var element in snapshot.data!.docs) {
            employes.add(Employe.fromMap(element.data()));
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: employes.length,
            itemBuilder: (context, index) {
              Employe employe = employes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProfilEmployee(employe: employes[index],),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(9),
                  margin: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          employe.image,
                          height: 90,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Text(
                        employe.nom + " " + employe.prenom,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        maxLines: 1,
                      ),
                      Text(employe.role,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 145, 0))),
                      Row(
                        children: [
                          Icon(CupertinoIcons.clock),
                          Text(employe.heure),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 166, 0),
        onPressed: () {
          Get.to(FormulaireAjoutDEmploye());
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
