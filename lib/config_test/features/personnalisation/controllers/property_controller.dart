import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombien_test/config_test/data/repositories/proprietes/properties_repository.dart';
import 'package:mombien_test/config_test/features/personnalisation/models/proprietes/propriete_model.dart';
import 'package:mombien_test/config_test/utils/constants/image_strings.dart';
import 'package:mombien_test/config_test/utils/helpers/network_manager.dart';
import 'package:mombien_test/config_test/utils/popups/full_screen_loader.dart';
import 'package:mombien_test/config_test/utils/popups/loaders.dart';

class PropertiesController extends GetxController {
  static PropertiesController get instance => Get.find();

  // Variables observables
  final isLoading = false.obs;

  // Controllers pour chaque champ
  final id = TextEditingController();
  final title = TextEditingController();
  final subTitle = TextEditingController();
  final description = TextEditingController();
  final thumbnail = TextEditingController();
  final images = <String>[].obs;
  final rooms = TextEditingController();
  final area = TextEditingController();
  final floors = TextEditingController();
  final price = TextEditingController();
  final rating = TextEditingController();
  final showers = TextEditingController();
  final livingRoom = TextEditingController();
  final category = TextEditingController();
  final status = TextEditingController();
  final owner = TextEditingController();

  // Clé de formulaire pour la validation
  GlobalKey<FormState> propertiesFormKey = GlobalKey<FormState>();

  // CRUD Operations
  // Fonction pour créer une nouvelle propriété
  Future<void> createProperty() async {
    if (!propertiesFormKey.currentState!.validate()) return;

    TFullScreenLoader.openLoadingDialog(
        'Création de la propriété...', 'assets/loading_animation.json');

    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: 'Erreur', message: 'Pas de connexion internet');
      return;
    }

    final newProperty = PropertiesModel(
      id: id.text.trim(),
      title: title.text.trim(),
      subTitle: subTitle.text.trim(),
      description: description.text.trim(),
      thumbnail: thumbnail.text.trim(),
      images: images.toList(),
      rooms: int.tryParse(rooms.text.trim()) ?? 0,
      area: double.tryParse(area.text.trim()) ?? 0.0,
      floors: int.tryParse(floors.text.trim()) ?? 0,
      price: double.tryParse(price.text.trim()) ?? 0.0,
      rating: double.tryParse(rating.text.trim()) ?? 0.0,
      showers: int.tryParse(showers.text.trim()) ?? 0,
      livingRoom: int.tryParse(livingRoom.text.trim()) ?? 0,
      category: category.text.trim(),
      status: status.text.trim(),
      owner: owner.text.trim(),
    );

    try {
      await PropertyRepository.instance.addProperty(newProperty);
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: 'Succès', message: 'Propriété créée avec succès');
      clearControllers();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Erreur', message: e.toString());
    }
  }

  // Fonction pour lire ou obtenir les informations d'une propriété
  Future<void> getProperty(String propertyId) async {
    isLoading.value = true;
    try {
      final property =
          await PropertyRepository.instance.getPropertyById(propertyId);
      if (property != null) {
        updateControllers(property);
        TLoaders.successSnackBar(title: 'Succès', message: 'Propriété chargée');
      } else {
        // Handle the case where property is null
        TLoaders.errorSnackBar(
            title: 'Erreur', message: 'Propriété non trouvée');
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Erreur', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Fonction pour mettre à jour une propriété existante
  Future<void> updateProperty() async {
    if (!propertiesFormKey.currentState!.validate()) return;

    TFullScreenLoader.openLoadingDialog(
        'Mise à jour de la propriété...', 'assets/loading_animation.json');

    final updatedProperty = PropertiesModel(
      id: id.text.trim(),
      title: title.text.trim(),
      subTitle: subTitle.text.trim(),
      description: description.text.trim(),
      thumbnail: thumbnail.text.trim(),
      images: images.toList(),
      rooms: int.tryParse(rooms.text.trim()) ?? 0,
      area: double.tryParse(area.text.trim()) ?? 0.0,
      floors: int.tryParse(floors.text.trim()) ?? 0,
      price: double.tryParse(price.text.trim()) ?? 0.0,
      rating: double.tryParse(rating.text.trim()) ?? 0.0,
      showers: int.tryParse(showers.text.trim()) ?? 0,
      livingRoom: int.tryParse(livingRoom.text.trim()) ?? 0,
      category: category.text.trim(),
      status: status.text.trim(),
      owner: owner.text.trim(),
    );

    try {
      await PropertyRepository.instance.updateProperty(updatedProperty);
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: 'Succès', message: 'Propriété mise à jour');
      clearControllers();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Erreur', message: e.toString());
    }
  }

  // Fonction pour supprimer une propriété
  Future<void> deleteProperty(String propertyId) async {
    TFullScreenLoader.openLoadingDialog(
        'Suppression de la propriété...', 'assets/loading_animation.json');
    try {
      await PropertyRepository.instance.deleteProperty(propertyId);
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Succès', message: 'Propriété supprimée');
      clearControllers();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Erreur', message: e.toString());
    }
  }

  // Fonction de mise à jour des contrôleurs à partir du modèle
  void updateControllers(PropertiesModel property) {
    id.text = property.id ?? '';
    title.text = property.title;
    subTitle.text = property.subTitle;
    description.text = property.description;
    thumbnail.text = property.thumbnail;
    images.value = property.images;
    rooms.text = property.rooms.toString();
    area.text = property.area.toString();
    floors.text = property.floors.toString();
    price.text = property.price.toString();
    rating.text = property.rating.toString();
    showers.text = property.showers.toString();
    livingRoom.text = property.livingRoom.toString();
    category.text = property.category;
    status.text = property.status;
    owner.text = property.owner;
  }

  // Fonction pour effacer les champs
  void clearControllers() {
    id.clear();
    title.clear();
    subTitle.clear();
    description.clear();
    thumbnail.clear();
    images.clear();
    rooms.clear();
    area.clear();
    floors.clear();
    price.clear();
    rating.clear();
    showers.clear();
    livingRoom.clear();
    category.clear();
    status.clear();
    owner.clear();
  }

  void submitProperty() async {
    try {
      // Affichage du chargement
      TFullScreenLoader.openLoadingDialog(
          'Enregistrement de la propriété...', TImages.docerAnimation);

      // Vérification de la connexion internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: 'Connexion',
            message: 'Veuillez vérifier votre connexion internet.');
        return;
      }

      // Validation du formulaire
      if (!propertiesFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Construction de la propriété avec les valeurs des contrôleurs
      final newProperty = PropertiesModel(
        id: id.text.trim(),
        title: title.text.trim(),
        subTitle: subTitle.text.trim(),
        description: description.text.trim(),
        thumbnail: thumbnail.text.trim(),
        images: images.toList(), // Conversion des images en liste
        rooms: int.parse(rooms.text.trim()),
        area: double.parse(area.text.trim()),
        floors: int.parse(floors.text.trim()),
        price: double.parse(price.text.trim()),
        rating: double.parse(rating.text.trim()),
        showers: int.parse(showers.text.trim()),
        livingRoom: int.parse(livingRoom.text.trim()),
        category: category.text.trim(),
        status: status.text.trim(),
        owner: owner.text.trim(),
      );

      final repository = Get.put(PropertyRepository());

      // Si un ID est présent, mise à jour ; sinon, création
      if (newProperty.id != null && newProperty.id!.isNotEmpty) {
        await repository.updateProperty(newProperty);
        TLoaders.successSnackBar(
            title: 'Succès', message: 'La propriété a été mise à jour.');
      } else {
        await repository.addProperty(newProperty);
        TLoaders.successSnackBar(
            title: 'Succès', message: 'La propriété a été ajoutée.');
      }

      TFullScreenLoader.stopLoading();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Erreur', message: e.toString());
    }
  }
}
