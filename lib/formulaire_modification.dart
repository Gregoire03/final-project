import 'package:application_de_gestion_des_resources/firebase.dart';
import 'package:application_de_gestion_des_resources/models/employe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FormulaireModificationDEmploye extends StatelessWidget {
   FormulaireModificationDEmploye({super.key, required this.employe});
   Employe employe;


   
  var formkey = GlobalKey<FormState>();
  get element => null;
  var utilisateurs=[];

  @override
  
  Widget build(BuildContext context) {
      TextEditingController nomController =TextEditingController(text: employe.nom);
  TextEditingController prenomController =TextEditingController(text: employe.prenom);
  TextEditingController roleController =TextEditingController(text: employe.role);
  TextEditingController emailController =TextEditingController(text: employe.email);
  TextEditingController telephoneController =TextEditingController(text: employe.numero);
  TextEditingController heuresController =TextEditingController(text: employe.heure);
  TextEditingController imageController =TextEditingController(text: employe.image);
  TextEditingController arriverController =TextEditingController(text: employe.arriver );
  TextEditingController departController =TextEditingController(text: employe.depart);
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter un employé"),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            
            children: [
          
              // le nom
              TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return"Veuillez entre votre nom";
            
                        }
                        print(nomController);
                        return null;
                      },
                      controller: nomController,
                      onChanged: (value) {
                        print(nomController.text);
                      },
                      decoration: InputDecoration(
                        labelText: "Nom",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40,),
                          TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return"Veuillez entre votre prénom";
            
                        }
                        print(prenomController);
                        return null;
                      },
                      controller: prenomController,
                      onChanged: (value) {
                        print(prenomController.text);
                      },
                      decoration: InputDecoration(
                        labelText: "Prenom",
                        border: OutlineInputBorder(),
                      ),
                    ),
          
                    SizedBox(height: 40,),
                    // le role
                     TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return"Veuillez entre votre role";
            
                        }
                        print(roleController);
                        return null;
                      },
                      controller: roleController,
                      onChanged: (value) {
                        print(roleController.text);
                      },
                      decoration: InputDecoration(
                        labelText: "Entrez le role",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    
                    SizedBox(height: 
                    40,),
                    // Adresse e-mail
                     TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return"Veuillez entre e-mail";
            
                        }
                        print(emailController);
                        return null;
                      },
                      controller: emailController,
                      onChanged: (value) {
                        print(emailController.text);
                      },
                      decoration: InputDecoration(
                        labelText: "email",
                        border: OutlineInputBorder(),
                      ),
                    ),
                        SizedBox(height: 40,),
                    // Adresse e-mail
                     TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return"Veuillez entre numero de telephone";
            
                        }
                        print(telephoneController);
                        return null;
                      },
                      controller: telephoneController,
                      onChanged: (value) {
                        print(telephoneController.text);
                      },
                      decoration: InputDecoration(
                        labelText: "Telephone",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    
                    SizedBox(height: 40,),
                    // La presence
                     TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return"Heures de Travail";
            
                        }
                        print(heuresController);
                        return null;
                      },
                      controller: heuresController,
                      onChanged: (value) {
                        print(heuresController.text);
                      },
                      decoration: InputDecoration(
                        labelText: "Heures de travail",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    
                    SizedBox(height: 40,), 
                    
                          TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return"Veuillez entre votre prénom";
            
                        }
                        print(imageController);
                        return null;
                      },
                      controller: imageController,
                      onChanged: (value) {
                        print(imageController.text);
                      },
                      decoration: InputDecoration(
                        labelText: "Image",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40,), 
                    
                          TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return"Veuillez entre votre prénom";
            
                        }
                        print(imageController);
                        return null;
                      },
                      controller: imageController,
                      onChanged: (value) {
                        print(imageController.text);
                      },
                      decoration: InputDecoration(
                        labelText: "Image",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40,),
                    TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return"Veuillez entre votre heure d'arriver";
            
                        }
                        print(arriverController);
                        return null;
                      },
                      controller: arriverController,
                      onChanged: (value) {
                        print(arriverController.text);
                      },
                      decoration: InputDecoration(
                        labelText: "Heure d'arriver",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40,),
                    TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return"Veuillez entre votre heure de départ";
            
                        }
                        print(departController);
                        return null;
                      },
                      controller: departController,
                      onChanged: (value) {
                        print(departController.text);
                      },
                      decoration: InputDecoration(
                        labelText: "Heure de départ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40,),
                    
                    

                    SizedBox(
                      height: 50,
                      width: Get.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                          backgroundColor: WidgetStatePropertyAll(Colors.teal)
                        ),
                        onPressed: (){
                        var nom =nomController.text;
                        var role =roleController.text;
                        var email = emailController.text;
                        var heures =heuresController.text;
                        var prenom = prenomController.text;
                        var telephone = telephoneController.text;
                        var image = imageController.text;
                        var arriver = arriverController.text;
                        var depart = departController.text;
                      
                        var employe = Employe(nom: nom, prenom: prenom, heure: heures, role: role, numero: telephone, email: email, image:image, arriver: arriver, depart: depart,);
                        FirebaseFirestore.instance.collection("Employes").doc(nom).set(employe.toMap());
                        Navigator.pop(context);
                        Navigator.pop(context);
                        
                        
                                
                      }, child: Text("Enregistrer",style: TextStyle(color: Colors.white),)),
                    ),
                    SizedBox(height: 50,),
              
                    
                    
              
            ],
          ),
        ),
      ),
   
    );
  }
  
  
}

