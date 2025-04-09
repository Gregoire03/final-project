import 'package:application_de_gestion_des_resources/formulaire_modification.dart';
import 'package:application_de_gestion_des_resources/models/employe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilEmployee extends StatelessWidget {
  const ProfilEmployee({super.key, required this.employe});
  final Employe employe;

  get element => null;

  get name => null;

  get role => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Informations personnelle de chaque empoyés")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(employe.image),
            SizedBox(height: 10),
            Text(
              employe.nom + " " + employe.prenom,
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 10),
            Text(
              employe.role,
              style: TextStyle(color: Colors.orange, fontSize: 25),
            ),
            SizedBox(height: 10),
            Text(
              "🕒 ${employe.heure}",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(employe.numero),

            SizedBox(height: 10),

            Text(employe.email),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            SizedBox(
              width: Get.width/2.1,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)))
                ),
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection("Employes")
                      .doc(employe.nom)
                      .delete();
              
                  Navigator.pop(context);
                },
                child: Text("Spprimer", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
              width: Get.width/2.1,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)))
                ),
                onPressed: () async {
                  Get.to(FormulaireModificationDEmploye(employe: employe));
                },
                child: Text("Modifier", style: TextStyle(color: Colors.black)),
              ),
            ),
            ],
        ),
      ),
    );
  }
}
