// import 'package:flutter/material.dart';

// class TableauDeBord extends StatelessWidget {
//   const TableauDeBord({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.cyanAccent,
//         title: Text("Page d'Acceuil"),
//       ),
//     body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.manage_accounts_rounded),
//             ElevatedButton(
//               onPressed: () {},
//               child:
//                Text("Gérer les employés"),
               
//             ),
//             SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: () {},
//               child: Text("Gérer l'inventaire"),
//             ),
//           ],
//         ),



        
//       ),
//       bottomNavigationBar: Container(
      
        
//         color: Colors.white12,
//         child:
        
//          Row(
          
          
//           children: [
            
            
//             Icon(Icons.dashboard),
//             Icon(Icons.reduce_capacity_outlined),
//             Icon(Icons.more_vert),
            
//           ],
//         ),
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';

void main() {
  runApp(const GestEmpApp());
}

class GestEmpApp extends StatelessWidget {
  const GestEmpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GestEmp',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const EmployesScreen(),
    );
  }
}

class EmployesScreen extends StatelessWidget {
  const EmployesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Liste des employés (dans un cas réel, cela viendrait probablement d'une API)
    final employes = List.generate(
      4,
      (index) => {
        'nom': 'Armelia Gone',
        'poste': 'Maçon principale',
        'horaires': '12h - 17h',
        'image': 'assets/employe_${index + 1}.jpg', // Vous devrez ajouter ces images à votre projet
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'GestEmp',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // En-tête Employés
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.people, color: Colors.black, size: 28),
                const SizedBox(width: 8),
                Text(
                  'Employés',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          
          // Grille d'employés
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.85,
              ),
              itemCount: employes.length,
              itemBuilder: (context, index) {
                final employe = employes[index];
                return EmployeCard(
                  nom: employe['nom']!,
                  poste: employe['poste']!,
                  horaires: employe['horaires']!,
                  imageUrl: employe['image']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EmployeCard extends StatelessWidget {
  final String nom;
  final String poste;
  final String horaires;
  final String imageUrl;

  const EmployeCard({
    Key? key,
    required this.nom,
    required this.poste,
    required this.horaires,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image de l'employé
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nom de l'employé
                Text(
                  nom,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                // Poste de l'employé
                Text(
                  poste,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 8),
                // Horaires de l'employé
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      horaires,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
