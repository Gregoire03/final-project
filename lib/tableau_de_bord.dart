import 'package:application_de_gestion_des_resources/home_page.dart';
import 'package:application_de_gestion_des_resources/home_page_stock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableauDeBord extends StatelessWidget {
  const TableauDeBord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Tableau de Bord"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bienvenue, KAO Julienne',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.to(() => const HomePage());
                            },
                            child: const Text(
                              "Employés",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 8),
                          StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Employes')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }
                              if (!snapshot.hasData ||
                                  snapshot.data!.docs.isEmpty) {
                                return const Text(
                                  '0',
                                  style: TextStyle(fontSize: 24),
                                );
                              }
                              final int nombreEmployes =
                                  snapshot.data!.docs.length;
                              return Text(
                                '$nombreEmployes',
                                style: const TextStyle(fontSize: 24),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.to(() => const HomePageStock());
                            },
                            child: const Text(
                              "Stocks",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '48', // Remplacez par le nombre réel si nécessaire
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Card(
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         const Text(
            //           'Employés qui travaillent aujourd\'hui',
            //           style:
            //               TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //         ),
            //         const SizedBox(height: 8),
            //         StreamBuilder<QuerySnapshot>(
            //           stream: FirebaseFirestore.instance
            //               .collection("Employes")
            //               .where("travail", isEqualTo: true) // Filtrer ceux qui travaillent
            //               .snapshots(),
            //           builder: (context, snapshot) {
            //             if (snapshot.connectionState ==
            //                 ConnectionState.waiting) {
            //               return const Center(
            //                   child: CircularProgressIndicator());
            //             }
            //             if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            //               return const Text("Aucun employé ne travaille aujourd'hui");
            //             }

            //             // Liste des employés qui travaillent
            //             return Column(
            //               children: snapshot.data!.docs.map((doc) {
            //                 final data = doc.data() as Map<String, dynamic>;
            //                 return ListTile(
            //                   leading: const Icon(Icons.work, color: Colors.green),
            //                   title: Text(data['nom']),
            //                   subtitle: Text(data['role']),
            //                 );
            //               }).toList(),
            //             );
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 16),
            // Card(
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         const Text(
            //           'Employés en congé',
            //           style:
            //               TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //         ),
            //         const SizedBox(height: 8),
            //         StreamBuilder<QuerySnapshot>(
            //           stream: FirebaseFirestore.instance
            //               .collection("Employes")
            //               .where("travail", isEqualTo: false) // Filtrer ceux en congé
            //               .snapshots(),
            //           builder: (context, snapshot) {
            //             if (snapshot.connectionState ==
            //                 ConnectionState.waiting) {
            //               return const Center(
            //                   child: CircularProgressIndicator());
            //             }
            //             if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            //               return const Text("Aucun employé en congé");
            //             }

            //             // Liste des employés en congé
            //             return Column(
            //               children: snapshot.data!.docs.map((doc) {
            //                 final data = doc.data() as Map<String, dynamic>;
            //                 return ListTile(
            //                   leading: const Icon(Icons.beach_access, color: Colors.blue),
            //                   title: Text(data['nom']),
            //                   subtitle: Text(data['role']),
            //                 );
            //               }).toList(),
            //             );
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
