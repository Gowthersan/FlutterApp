import 'package:cloud_firestore/cloud_firestore.dart';

class PropertiesModel {
  final String? id; // Identifiant unique pour chaque propriété
  String title; // Titre de la propriété
  String subTitle; // Sous-titre ou adresse de la propriété
  String description; // Description détaillée de la propriété
  String thumbnail; // Chemin de l'image miniature
  List<String> images; // Liste d'images de la propriété
  int rooms; // Nombre de chambres
  double area; // Surface en pieds carrés
  int floors; // Nombre d'étages
  int showers; // Nombre de douches
  int livingRoom; // Nombre de salons
  double price; // Prix de la propriété
  double rating; // Note de la propriété
  String category; // Catégorie de la propriété (ex : Villas, Maisons)
  String status; // Statut de la propriété (ex : Acheté, Vendu, En location)
  String owner; // Propriétaire de la propriété

  // Constructeur
  PropertiesModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.thumbnail,
    required this.images,
    required this.rooms,
    required this.area,
    required this.floors,
    required this.price,
    required this.rating,
    required this.showers,
    required this.livingRoom,
    required this.category,
    required this.status,
    required this.owner,
  });

  // Méthode pour convertir le modèle en JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subTitle': subTitle,
        'description': description,
        'thumbnail': thumbnail,
        'images': images,
        'rooms': rooms,
        'area': area,
        'floors': floors,
        'price': price,
        'rating': rating,
        'showers': showers,
        'livingRoom': livingRoom,
        'category': category,
        'status': status,
        'owner': owner,
      };

  // Factory method pour créer un PropertiesModel à partir d'un document Firestore
  factory PropertiesModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return PropertiesModel(
        id: document.id,
        title: data['title'] ?? '',
        subTitle: data['subTitle'] ?? '',
        description: data['description'] ?? '',
        thumbnail: data['thumbnail'] ?? '',
        images: List<String>.from(data['images'] ?? []),
        rooms: data['rooms'] ?? 0,
        area: data['area'] ?? 0,
        floors: data['floors'] ?? 0,
        price: data['price'] ?? 0,
        rating: data['rating'] ?? 0.0,
        showers: data['showers'] ?? 0,
        livingRoom: data['livingRoom'] ?? 0,
        category: data['category'] ?? '',
        status: data['status'] ?? '',
        owner: data['owner'] ?? '',
      );
    } else {
      return PropertiesModel(
        id: '',
        title: '',
        subTitle: '',
        description: '',
        thumbnail: '',
        images: [],
        rooms: 0,
        area: 0,
        floors: 0,
        price: 0,
        rating: 0.0,
        showers: 0,
        livingRoom: 0,
        category: '',
        status: '',
        owner: '',
      );
    }
  }
}
