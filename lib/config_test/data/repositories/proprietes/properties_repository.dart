import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mombien_test/config_test/features/personnalisation/models/proprietes/propriete_model.dart';
import 'package:mombien_test/config_test/utils/exceptions/firebase_exceptions.dart';
import 'package:mombien_test/config_test/utils/exceptions/format_exceptions.dart';
import 'package:mombien_test/config_test/utils/exceptions/platform_exceptions.dart';

class PropertyRepository extends GetxController {
  static PropertyRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Fonction pour ajouter une propriété dans Firestore
  Future<void> addProperty(PropertiesModel property) async {
    try {
      await _db
          .collection("Properties")
          .doc(property.id)
          .set(property.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'On dirait qu\'il y a un problème. Veuillez réessayer.';
    }
  }

  // Fonction pour récupérer toutes les propriétés
  Future<List<PropertiesModel>> getAllProperties() async {
    try {
      QuerySnapshot snapshot = await _db.collection("Properties").get();
      return snapshot.docs.map((doc) {
        return PropertiesModel.fromSnapshot(
            doc as DocumentSnapshot<Map<String, dynamic>>);
      }).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'On dirait qu\'il y a un problème. Veuillez réessayer.';
    }
  }

  // Fonction pour récupérer une propriété par son ID
  Future<PropertiesModel?> getPropertyById(String propertyId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _db.collection("Properties").doc(propertyId).get();
      if (snapshot.exists) {
        return PropertiesModel.fromSnapshot(snapshot);
      }
      return null; // Propriété non trouvée
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'On dirait qu\'il y a un problème. Veuillez réessayer.';
    }
  }

  // Fonction pour mettre à jour uertiespriété
  Future<void> updateProperty(PropertiesModel property) async {
    try {
      await _db
          .collection("Properties")
          .doc(property.id)
          .update(property.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'On dirait qu\'il y a un problème. Veuillez réessayer.';
    }
  }

  // Fonction pour supprimer une propriété
  Future<void> deleteProperty(String propertyId) async {
    try {
      await _db.collection("Properties").doc(propertyId).delete();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'On dirait qu\'il y a un problème. Veuillez réessayer.';
    }
  }
}
