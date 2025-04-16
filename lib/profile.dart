import 'package:application_de_gestion_des_resources/interface_de_connexion.dart';
import 'package:application_de_gestion_des_resources/models/utilisateur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var email = "";

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange,
        title: Text("Profil",style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('Utilisateurs')
            .doc(email)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          Utilisateur utilisateur;
          utilisateur = Utilisateur.fromMap(snapshot.data!.data()!);
          return Center(
            child: SizedBox(
              width: Get.width,
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    child: Icon(Icons.person),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    utilisateur.nom + " " + utilisateur.prenom,  style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () {
              Get.dialog(Dialog(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                  
                      Text("Deconnexion", style: TextStyle(fontSize: 50),),
                      SizedBox(height: 10,),
                      Text("Voulez-vous vraiment vous deconnecter ?",style: TextStyle(fontSize: 15),),
                      SizedBox(height: 20,),
                      TextButton(onPressed: (){
                        Get.back();
                      }, child: Text("Non")),
                      TextButton(onPressed: (){
                        Get.off(InterfaceDeConnexion());
                      }, child: Text("Oui")),
                    ],
                  ),
                ),
              ),));

            }, 
              
              child: Text('Deconnexion',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24, 
            

          ),
          ),
          
          
            )
            
            ),
            
          );
          
          
    
  }
  
}
