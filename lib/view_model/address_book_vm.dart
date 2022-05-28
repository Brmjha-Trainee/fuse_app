import 'package:cloud_firestore/cloud_firestore.dart';

class Adress1 {
  String ? uid ;
  String? city;
  String? district;
  String? street;
  String? zipCode;
  String? link;
   List u =[] ;

  Adress1({
    this.uid,
    this.city,
        this.district,
        this.street,
        this.zipCode,
        this.link,
        
  });
  factory Adress1.fromJson(DocumentSnapshot<Map<String, dynamic>> address)=> Adress1(city:address['City'] as String,district:address['District'] as String,street:address['Street'] as String ,zipCode:address['Zip Code'] as String ,link:address['Link'] as String);
 }
