import 'package:application_de_gestion_des_resources/formulaire_ajout_d_employe.dart';
import 'package:application_de_gestion_des_resources/formulaire_ajout_de_stock.dart';
import 'package:application_de_gestion_des_resources/formulaire_ajout_stock.dart'; // Ensure this file contains the FormulaireAjoutStock class
import 'package:application_de_gestion_des_resources/models/stock.dart';
import 'package:application_de_gestion_des_resources/profil_employee.dart';
import 'package:application_de_gestion_des_resources/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageStock extends StatelessWidget {
  const HomePageStock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Liste des stocks",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                Get.to(() {
                  var employe = null;
                  return ProfilEmployee(employe: employe);
                });
              },
              icon: const Icon(Icons.person),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Stock").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Aucun stock disponible"));
          }

          // Conversion des documents Firestore en objets Stock
          List<Stock> stocks = snapshot.data!.docs
              .map((doc) => Stock.fromMap(doc.data() as Map<String, dynamic>))
              .toList();

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: stocks.length,
            itemBuilder: (context, index) {
              Stock stock = stocks[index];
              return GestureDetector(
                onTap: () {
                 
                },
                child: Container(
                  padding: const EdgeInsets.all(9),
                  margin: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          stock.image,
                          height: 90,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        stock.nom,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${stock.prixunitair} FCFA",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 145, 0),
                        ),
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
          // Remplacez par une navigation vers un formulaire d'ajout de stock
          Get.to(() => FormulaireAjoutDeStock());
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}