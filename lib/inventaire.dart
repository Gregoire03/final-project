import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inventaire extends StatelessWidget {
  const Inventaire({super.key});

  @override
  Widget build(BuildContext context) {
    var inventoryItemCard = InventoryItemCard(
            category: 'Ordinateur',
            name: 'HP ProBook',
            quantity: 3,
            status: 'Stock bas',
            statusIcon: Icon(Icons.warning, color: Colors.orange),
          );
    var inventoryItemCard2 = inventoryItemCard;
    var inventoryItemCard22 = inventoryItemCard2;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventaire'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16.0),
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      children: [
         InventoryItemCard(
            category: 'Écran',
            name: 'Dell 24"',
            quantity: 7,
            status: 'En stock',
            statusIcon: Icon(Icons.check_circle, color: Colors.green),
          ),
          InventoryItemCard(
            category: 'Clavier',
            name: 'Logitech K380',
            quantity: 12,
            status: 'En stock',
            statusIcon: Icon(Icons.check_circle, color: Colors.green),
          ),
          InventoryItemCard(
            category: 'Souris',
            name: 'Logitech MX',
            quantity: 15,
            status: 'En stock',
            statusIcon: Icon(Icons.check_circle, color: Colors.green),
          ),
      

      ]
         
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action pour ajouter un nouvel élément
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class InventoryItemCard extends StatelessWidget {
  final String category;
  final String name;
  final int quantity;
  final String status;
  final Widget statusIcon;

  const InventoryItemCard({
    super.key,
    required this.category,
    required this.name,
    required this.quantity,
    required this.status,
    required this.statusIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '[$category]',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Text('Quantité: $quantity'),
            const SizedBox(height: 8),
            Row(
              children: [
                statusIcon,
                const SizedBox(width: 4),
                Text(status),
              ],
            ),
          ],
        ),
      ),
    );
  }
}