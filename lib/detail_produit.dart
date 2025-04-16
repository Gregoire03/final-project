import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailProduit extends StatelessWidget {
  const DetailProduit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du produit'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: const Center(
                  child: Text('[Image ordinateur]', style: TextStyle(color: Colors.grey)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'HP ProBook 450 G8',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ordinateur portable',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Text('Quantité: 3'),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.warning, color: Colors.orange),
                SizedBox(width: 4),
                Text('Stock bas'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Référence: ORD-001'),
            const SizedBox(height: 8),
            const Text('Prix unitaire: 899€'),
            const SizedBox(height: 8),
            const Text('Date dernier inventaire: 12/04/2025'),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action to delete
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Supprimer', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action to modify
                  },
                  child: const Text('Modifier'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





    